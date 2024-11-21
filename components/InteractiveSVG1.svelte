<script>
export let src

fetch(src)
  .then(response => response.text())
  .then(svgContent => {
    const container = document.getElementById('svg-container');
    container.innerHTML = svgContent;
  })
  .catch(error => {
    console.error('Error fetching the SVG:', error);
  });

</script>

<div id="svg-container"></div>


