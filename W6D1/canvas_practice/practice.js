document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  let ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(200, 0, 0)';
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = 'green';
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = 'purple';
  ctx.fill();
});
