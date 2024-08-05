function loadSVG() {

  fetch('assets/WorldMap.svg')
    .then(response => response.text())
    .then(svgText => {

      const mapContainer = document.getElementById('map-container');
      mapContainer.innerHTML = svgText;


      const svgElement = mapContainer.querySelector('svg');
      if (svgElement) {
        svgElement.setAttribute('viewBox', '0 0 2754 1398'); 
        svgElement.setAttribute('preserveAspectRatio', 'xMidYMid meet');
      }

      const clickedCountries = JSON.parse(sessionStorage.getItem('clickedCountries')) || [];

      clickedCountries.forEach(countryId => {
        const element = document.getElementById(countryId);
        if (element) {
          element.classList.add('highlight');
        }
      });

      document.querySelectorAll('.landxx').forEach(function(element) {
        element.addEventListener('click', function() {
          document.querySelectorAll('.landxx').forEach(el => {
            el.classList.remove('highlight');
          });

          this.classList.add('highlight');
          this.querySelectorAll('.landxx').forEach(child => {
            child.classList.add('highlight');
          });

          const countryId = this.id;
          if (countryId) {
            if (!clickedCountries.includes(countryId)) {
              clickedCountries.push(countryId);
              sessionStorage.setItem('clickedCountries', JSON.stringify(clickedCountries));
            }

            window.location.href = `${countryId}Quiz.html`;
          }
        });
      });
    })
    .catch(error => console.error('Error loading the SVG:', error));
}

window.onload = loadSVG;
