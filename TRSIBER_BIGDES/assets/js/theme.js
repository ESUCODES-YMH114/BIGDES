// Theme management
const themeToggle = document.getElementById('theme-toggle');
const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)');

// Check for saved theme preference or use system preference
const currentTheme = localStorage.getItem('theme') || 
    (prefersDarkScheme.matches ? 'dark' : 'light');

// Apply theme on load
document.documentElement.setAttribute('data-theme', currentTheme);

// Theme toggle function
function toggleTheme() {
    const newTheme = document.documentElement.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
}

// Add theme toggle button to header if it doesn't exist
if (!themeToggle) {
    const headerContainer = document.querySelector('.header-container');
    if (headerContainer) {
        const themeButton = document.createElement('button');
        themeButton.id = 'theme-toggle';
        themeButton.className = 'theme-toggle';
        themeButton.innerHTML = '<i class="fas fa-moon"></i>';
        themeButton.addEventListener('click', toggleTheme);
        headerContainer.appendChild(themeButton);
    }
}

// Update theme toggle button icon
function updateThemeIcon() {
    const themeToggle = document.getElementById('theme-toggle');
    if (themeToggle) {
        const icon = themeToggle.querySelector('i');
        if (icon) {
            icon.className = document.documentElement.getAttribute('data-theme') === 'dark' 
                ? 'fas fa-sun' 
                : 'fas fa-moon';
        }
    }
}

// Listen for theme changes
document.addEventListener('DOMContentLoaded', updateThemeIcon);
document.addEventListener('themechange', updateThemeIcon); 