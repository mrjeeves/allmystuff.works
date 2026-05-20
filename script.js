(() => {
  const header = document.querySelector('.site-header');
  const onScroll = () => {
    if (!header) return;
    header.dataset.elevated = window.scrollY > 8 ? 'true' : 'false';
  };
  document.addEventListener('scroll', onScroll, { passive: true });
  onScroll();

  const toggle = document.querySelector('.nav-toggle');
  const mobileNav = document.getElementById('mobile-nav');
  if (toggle && mobileNav) {
    const setOpen = (open) => {
      toggle.setAttribute('aria-expanded', String(open));
      mobileNav.toggleAttribute('hidden', !open);
      mobileNav.dataset.open = String(open);
    };
    toggle.addEventListener('click', () => {
      const open = toggle.getAttribute('aria-expanded') !== 'true';
      setOpen(open);
    });
    mobileNav.querySelectorAll('a').forEach((a) => {
      a.addEventListener('click', () => setOpen(false));
    });
  }

  const year = document.getElementById('year');
  if (year) year.textContent = new Date().getFullYear();

  const form = document.querySelector('.signup-form');
  if (form) {
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      const input = form.querySelector('input[type="email"]');
      const button = form.querySelector('button');
      if (!input || !button) return;
      if (!input.checkValidity()) {
        input.focus();
        return;
      }
      const original = button.textContent;
      button.textContent = 'Sending invite…';
      button.disabled = true;
      setTimeout(() => {
        button.textContent = 'Check your inbox ✓';
        input.value = '';
        setTimeout(() => {
          button.textContent = original;
          button.disabled = false;
        }, 2400);
      }, 700);
    });
  }
})();
