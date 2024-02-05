function toggleDetails(id) {
  let details = document.getElementById(id);
  details.classList.toggle("show");
}

async function showTooltip(element) {
  const tooltip = element.nextElementSibling;

  // Ustalamy pozycję tooltipu względem kontenera
  const offsetTop = -tooltip.offsetHeight - 5;
  const offsetLeft = element.offsetWidth + 10; // Dodajemy odstęp od lewej strony

  tooltip.style.display = 'block';
  await new Promise(resolve => setTimeout(resolve, 100));
  tooltip.style.transform = "translateX(0)"
  tooltip.style.opacity = 1;
  tooltip.style.top = offsetTop + 'px';
  tooltip.style.left = offsetLeft + 'px';
}

async function hideTooltip(element) {
  const tooltip = element.nextElementSibling;
  tooltip.style.opacity = 0;
  tooltip.style.transform = "translateX(20px)"
  await new Promise(resolve => setTimeout(resolve, 100));
  tooltip.style.display = 'none';
}

