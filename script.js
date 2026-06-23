/* ============================================================
   PRAVINRAJ SIVABATHI – E-PORTFOLIO JAVASCRIPT
   Handles: navbar, type animation, scroll spy, observers
   ============================================================ */

'use strict';

/* ---- 1. NAVBAR: scroll effect + mobile toggle ---- */
const navbar     = document.getElementById('navbar');
const hamburger  = document.getElementById('hamburger');
const navLinks   = document.getElementById('nav-links');
const navLinkEls = document.querySelectorAll('.nav-link');

window.addEventListener('scroll', () => {
  if (window.scrollY > 30) {
    navbar.classList.add('scrolled');
  } else {
    navbar.classList.remove('scrolled');
  }
  updateScrollTop();
}, { passive: true });

hamburger.addEventListener('click', () => {
  hamburger.classList.toggle('open');
  navLinks.classList.toggle('open');
});

navLinkEls.forEach(link => {
  link.addEventListener('click', () => {
    hamburger.classList.remove('open');
    navLinks.classList.remove('open');
  });
});

/* ---- 2. SCROLL SPY: highlight active nav link ---- */
const sections = document.querySelectorAll('section[id]');

const spyObserver = new IntersectionObserver(
  (entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        navLinkEls.forEach(link => {
          link.classList.toggle(
            'active',
            link.getAttribute('href') === `#${entry.target.id}`
          );
        });
      }
    });
  },
  { rootMargin: '-40% 0px -55% 0px' }
);
sections.forEach(sec => spyObserver.observe(sec));

/* ---- 3. SCROLL-TO-TOP BUTTON ---- */
const scrollTopBtn = document.getElementById('scroll-top');

function updateScrollTop() {
  if (window.scrollY > 400) {
    scrollTopBtn.classList.add('visible');
  } else {
    scrollTopBtn.classList.remove('visible');
  }
}
scrollTopBtn.addEventListener('click', () => {
  window.scrollTo({ top: 0, behavior: 'smooth' });
});

/* ---- 4. ROLE TYPING ANIMATION ---- */
const roles = [
  'Data Engineering Student',
  'PETRONAS Scholar',
  'Aspiring Data Engineer',
  'Big Data Enthusiast',
  'Cloud & BI Explorer'
];

let roleIndex    = 0;
let charIndex    = 0;
let isDeleting   = false;
const roleEl     = document.getElementById('role-text');
const typingSpeed  = 80;
const deletingSpeed = 45;
const pauseDelay   = 2200;

function typeRole() {
  if (!roleEl) return;
  const current = roles[roleIndex];

  if (!isDeleting) {
    roleEl.textContent = current.slice(0, charIndex + 1);
    charIndex++;
    if (charIndex === current.length) {
      isDeleting = true;
      setTimeout(typeRole, pauseDelay);
      return;
    }
  } else {
    roleEl.textContent = current.slice(0, charIndex - 1);
    charIndex--;
    if (charIndex === 0) {
      isDeleting  = false;
      roleIndex   = (roleIndex + 1) % roles.length;
    }
  }
  setTimeout(typeRole, isDeleting ? deletingSpeed : typingSpeed);
}
typeRole();

/* ---- 5. SCROLL-TRIGGERED ANIMATIONS ---- */
const animatables = document.querySelectorAll(
  '.glass-card, .project-card, .competition-card, .cert-card, .award-card, .semester-card, .contact-card, .about-card, .section-header'
);

animatables.forEach(el => el.classList.add('animate-up'));

const animObserver = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry, i) => {
      if (entry.isIntersecting) {
        // stagger siblings
        const siblings = Array.from(entry.target.parentElement.children);
        const idx = siblings.indexOf(entry.target);
        setTimeout(() => {
          entry.target.classList.add('visible');
        }, idx * 80);
        animObserver.unobserve(entry.target);
      }
    });
  },
  { threshold: 0.12 }
);
animatables.forEach(el => animObserver.observe(el));

/* ---- 6. HERO STATS NUMBER COUNT-UP ---- */
const statNumbers = document.querySelectorAll('.stat-number');

const countUp = (el, target) => {
  let count  = 0;
  const step = Math.ceil(target / 40);
  const interval = setInterval(() => {
    count = Math.min(count + step, target);
    el.textContent = count + (el.dataset.suffix || '+');
    if (count >= target) clearInterval(interval);
  }, 40);
};

const statsObserver = new IntersectionObserver(
  (entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        statNumbers.forEach(el => {
          const val = parseInt(el.textContent, 10);
          el.dataset.suffix = el.textContent.replace(/\d/g, '').trim();
          countUp(el, val);
        });
        statsObserver.disconnect();
      }
    });
  },
  { threshold: 0.5 }
);

const heroStats = document.querySelector('.hero-stats');
if (heroStats) statsObserver.observe(heroStats);

/* ---- 7. SMOOTH ACTIVE INDICATOR LINE in navbar ---- */
function updateActiveNav() {
  let current = '';
  sections.forEach(section => {
    const sectionTop    = section.offsetTop - var_navHeight();
    const sectionHeight = section.clientHeight;
    if (window.scrollY >= sectionTop - 120 && window.scrollY < sectionTop + sectionHeight - 120) {
      current = section.getAttribute('id');
    }
  });
  navLinkEls.forEach(link => {
    link.classList.remove('active');
    if (link.getAttribute('href') === `#${current}`) {
      link.classList.add('active');
    }
  });
}
function var_navHeight() { return parseInt(getComputedStyle(document.documentElement).getPropertyValue('--nav-height'), 10) || 68; }
window.addEventListener('scroll', updateActiveNav, { passive: true });

/* ---- 8. PROJECT CARD TILT EFFECT (subtle) ---- */
const projectCards = document.querySelectorAll('.project-card');

projectCards.forEach(card => {
  card.addEventListener('mousemove', (e) => {
    const rect   = card.getBoundingClientRect();
    const x      = e.clientX - rect.left;
    const y      = e.clientY - rect.top;
    const xPct   = (x / rect.width  - 0.5) * 8;
    const yPct   = (y / rect.height - 0.5) * 8;
    card.style.transform = `translateY(-4px) rotateX(${-yPct}deg) rotateY(${xPct}deg)`;
  });
  card.addEventListener('mouseleave', () => {
    card.style.transform = '';
  });
});

/* ---- 9. CURSOR GLOW TRAIL (optional, desktop only) ---- */
if (window.innerWidth > 768 && window.matchMedia('(pointer: fine)').matches) {
  const glow = document.createElement('div');
  glow.style.cssText = `
    position: fixed;
    width: 300px;
    height: 300px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(99,102,241,0.08) 0%, transparent 70%);
    pointer-events: none;
    transform: translate(-50%, -50%);
    transition: left 0.15s ease, top 0.15s ease;
    z-index: 0;
    mix-blend-mode: screen;
  `;
  document.body.appendChild(glow);

  document.addEventListener('mousemove', (e) => {
    glow.style.left = `${e.clientX}px`;
    glow.style.top  = `${e.clientY}px`;
  }, { passive: true });
}

/* ---- 10. ACTIVE SECTION HIGHLIGHT on load ---- */
document.addEventListener('DOMContentLoaded', () => {
  updateActiveNav();
});

console.log('%c Pravinraj Sivabathi – Portfolio ', 'background: linear-gradient(135deg,#6366F1,#8B5CF6,#06B6D4); color:#fff; font-size:14px; padding:8px 16px; border-radius:6px; font-weight:700;');
console.log('%c Data Engineering Student | PETRONAS Scholar | UTM ', 'color: #94A3B8; font-size: 11px;');
