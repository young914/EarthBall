const canvas = document.getElementById("jsCanvas");
const ctx = canvas.getContext("2d");
const colors = document.getElementsByClassName("jsColor");
const range = document.getElementById("jsRange");
const mode =  document.getElementById("jsMode");

const INITIAL_COLOR = "#000000"
const CANVAS_SIZE= 660;
const CANVAS_SIZE1= 400;

ctx.strokeStyle = "#2c2c2c";

canvas.width= CANVAS_SIZE;
canvas.height = CANVAS_SIZE1;
ctx.strokeStyle = INITIAL_COLOR;
ctx.fillStyle = INITIAL_COLOR;
ctx.lineWidth = 3.5;

let painting = false;
let filling = false;

function stopPainting() {
    painting = false;
}

function startPainting() {
    painting = true;
}

function onMouseMove(event) {
    const x = event.offsetX;
    const y = event.offsetY;
    if(!painting) {
        ctx.beginPath();
        ctx.moveTo(x, y);
    } else {
        ctx.lineTo(x, y);
        ctx.stroke();
    }
}

function handleColorClick(event) {
    const color = event.target.style.backgroundColor;
    ctx.strokeStyle = color;
    ctx.fillStyle = color;
}

function handleRangeChange(event) {
    const size = event.target.value;
    ctx.lineWidth = size;
}

function handleModeClick() {
    if(filling === true) {
        filling = false;
        $("#jsMode").html("채우기");
    } else {
        filling = true;
        $("#jsMode").html("그리기");
    }
}

function handleCanvasClick() {
    if(filling) {
        ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE1);
    }
}

if(canvas) {
    canvas.addEventListener("mousemove", onMouseMove);
    canvas.addEventListener("mousedown", startPainting);
    canvas.addEventListener("mouseup", stopPainting);
    canvas.addEventListener("mouseleave", stopPainting);
    canvas.addEventListener("click", handleCanvasClick);
}


Array.from(colors).forEach(color =>
    color.addEventListener("click", handleColorClick));

if(range) {
    range.addEventListener("input", handleRangeChange);
}

if(mode) {
    mode.addEventListener("click", handleModeClick);
}

function colorChange(color){
    ctx.strokeStyle = color;
}

// 전체 지우기
function clearAll(){
    ctx.clearRect(0, 0, canvas.width, canvas.height);
}


// 이미지 전송
 function drawingBtn() {
  const imgBase64 = canvas.toDataURL('image/jpeg', 'image/octet-stream');
  const decodImg = atob(imgBase64.split(',')[1]);
  let array = [];

  for (let i = 0; i < decodImg .length; i++) {
    array.push(decodImg .charCodeAt(i));
  }

  const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
  const fileName = 'canvas_img_' + new Date().getMilliseconds() + '.jpg';
  let formData = new FormData();
  formData.append('file', file, fileName);

  $.ajax({
    type: 'post',
    url: '/upload',
    cache: false,
    data: formData,
    processData: false,
    contentType: false,
    success: function (data) {
      alert('Uploaded !!')
    	}
  	})
  };


// 날씨 아이콘 버튼 이벤트
 document.querySelector('#c_1').addEventListener('click', function(event) {
  event.preventDefault();
  var target = document.querySelector('#c_1');
  if (target.classList.contains('active1')) {
    target.classList.remove('active1');
  } else {
    target.classList.add('active1');
	document.querySelector('#c_2').classList.remove('active2');
	document.querySelector('#c_3').classList.remove('active3');
	document.querySelector('#c_4').classList.remove('active4');
  }
});

 document.querySelector('#c_2').addEventListener('click', function(event) {
  event.preventDefault();
  var target = document.querySelector('#c_2');
  if (target.classList.contains('active2')) {
    target.classList.remove('active2');
  } else {
    target.classList.add('active2');
    document.querySelector('#c_1').classList.remove('active1');
    document.querySelector('#c_3').classList.remove('active3');
	document.querySelector('#c_4').classList.remove('active4');
  }
});

 document.querySelector('#c_3').addEventListener('click', function(event) {
  event.preventDefault();
  var target = document.querySelector('#c_3');
  if (target.classList.contains('active3')) {
    target.classList.remove('active3');
  } else {
    target.classList.add('active3');
    document.querySelector('#c_1').classList.remove('active1');
    document.querySelector('#c_2').classList.remove('active2');
	document.querySelector('#c_4').classList.remove('active4');
  }
});

 document.querySelector('#c_4').addEventListener('click', function(event) {
  event.preventDefault();
  var target = document.querySelector('#c_4');
  if (target.classList.contains('active4')) {
    target.classList.remove('active4');
  } else {
    target.classList.add('active4');
    document.querySelector('#c_1').classList.remove('active1');
    document.querySelector('#c_2').classList.remove('active2');
	document.querySelector('#c_3').classList.remove('active3');
  }
});