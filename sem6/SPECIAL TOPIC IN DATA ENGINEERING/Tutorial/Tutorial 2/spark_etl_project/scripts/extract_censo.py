import zipfile
import shutil
from pathlib import Path

# Years used in the project
YEARS = list(range(2010, 2022))

# Folder paths
RAW_DIR = Path("raw_zip")
EXTRACTED_DIR = Path("extracted")
DATA_DIR = Path("data")

# Create folders if they do not exist
EXTRACTED_DIR.mkdir(exist_ok=True)
DATA_DIR.mkdir(exist_ok=True)


def find_main_csv(folder_path):
    """
    Finds the main Censo Escolar CSV file from the extracted folder.

    Some years may have different folder/file names.
    This function tries to find the most relevant CSV file.
    """

    # Find all CSV files inside extracted folder
    csv_files = list(folder_path.rglob("*.csv")) + list(folder_path.rglob("*.CSV"))

    if not csv_files:
        return None

    # Preferred names/keywords for the main dataset
    preferred_keywords = [
        "microdados_ed_basica",
        "MICRODADOS_ED_BASICA",
        "microdados_educacao_basica",
        "MICRODADOS_EDUCACAO_BASICA",
        "ESCOLAS",
        "ESCOLA",
        "DADOS_ESCOLAS",
        "EDUCACENSO",
    ]

    # First, try to find CSV based on preferred keywords
    for keyword in preferred_keywords:
        matched_files = [
            file for file in csv_files
            if keyword.lower() in file.name.lower()
        ]

        if matched_files:
            # If multiple matched, take the largest one
            return max(matched_files, key=lambda file: file.stat().st_size)

    # If no keyword match, take the largest CSV file
    return max(csv_files, key=lambda file: file.stat().st_size)


for year in YEARS:
    zip_path = RAW_DIR / f"microdados_censo_escolar_{year}.zip"
    extract_folder = EXTRACTED_DIR / str(year)
    final_csv_path = DATA_DIR / f"{year}.csv"

    print(f"\nProcessing year: {year}")

    # Skip if final CSV already exists
    if final_csv_path.exists() and final_csv_path.stat().st_size > 10_000_000:
        print(f"{year}: data/{year}.csv already exists. Skipping.")
        continue

    # Check if ZIP exists
    if not zip_path.exists():
        print(f"{year}: ZIP file not found -> {zip_path}")
        continue

    # Check if ZIP is not empty/corrupted from failed download
    if zip_path.stat().st_size < 10_000:
        print(f"{year}: ZIP file seems too small. It may be failed/corrupted.")
        continue

    # Extract ZIP
    print(f"{year}: extracting {zip_path} ...")

    extract_folder.mkdir(exist_ok=True)

    try:
        with zipfile.ZipFile(zip_path, "r") as zip_ref:
            zip_ref.extractall(extract_folder)

    except zipfile.BadZipFile:
        print(f"{year}: bad ZIP file. Please re-download this year.")
        continue

    except Exception as error:
        print(f"{year}: extraction failed -> {error}")
        continue

    # Find main CSV
    main_csv = find_main_csv(extract_folder)

    if main_csv is None:
        print(f"{year}: no CSV file found after extraction.")
        continue

    print(f"{year}: selected CSV -> {main_csv}")
    print(f"{year}: copying to -> {final_csv_path}")

    # Copy selected CSV to data folder as 2010.csv, 2011.csv, etc.
    shutil.copy2(main_csv, final_csv_path)

    print(f"{year}: completed successfully.")


print("\nExtraction step completed.")