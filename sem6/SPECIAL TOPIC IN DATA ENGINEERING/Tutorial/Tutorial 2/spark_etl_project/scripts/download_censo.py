import os
import requests
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

YEARS = list(range(2010, 2022))

URL_PATTERNS = [
    "https://download.inep.gov.br/dados_abertos/microdados_censo_escolar_{}.zip",
    "https://download.inep.gov.br/microdados/microdados_censo_escolar_{}.zip",
    "https://download.inep.gov.br/microdados/microdados_educacao_basica_{}.zip",
]

RAW_DIR = "raw_zip"
os.makedirs(RAW_DIR, exist_ok=True)

def download_file(url, output_path):
    with requests.get(url, stream=True, timeout=120, verify=False) as response:
        if response.status_code != 200:
            print(f"Status code: {response.status_code}")
            return False

        total = int(response.headers.get("content-length", 0))
        downloaded = 0

        with open(output_path, "wb") as file:
            for chunk in response.iter_content(chunk_size=1024 * 1024):
                if chunk:
                    file.write(chunk)
                    downloaded += len(chunk)

                    if total > 0:
                        percent = downloaded / total * 100
                        print(f"\rProgress: {percent:.1f}%", end="")

        print()
        return True

for year in YEARS:
    output_path = os.path.join(RAW_DIR, f"microdados_censo_escolar_{year}.zip")

    if os.path.exists(output_path) and os.path.getsize(output_path) > 10_000_000:
        print(f"{year}: already downloaded.")
        continue

    print(f"\nDownloading {year}...")

    success = False

    for pattern in URL_PATTERNS:
        url = pattern.format(year)
        print(f"Trying: {url}")

        try:
            if download_file(url, output_path):
                print(f"{year}: downloaded successfully.")
                success = True
                break
        except Exception as error:
            print(f"{year}: error - {error}")

    if not success:
        print(f"{year}: failed. Download manually from INEP if needed.")

print("\nDownload step completed.")