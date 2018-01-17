console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  method: 'get',
  url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=fac19547d3e2d63c62ba25ceab94379b',
  success: (data) => {
    console.log(data);
  }
});
// Add another console log here, outside your AJAX request
console.log("Finished ajax request");
