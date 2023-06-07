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

	 console.log("호출되나?");

    var imgDataUrl = canvas.toDataURL('image/png');

    var blobBin = atob(imgDataUrl.split(',')[1]);	// base64 데이터 디코딩
    var array = [];
    for (var i = 0; i < blobBin.length; i++) {
        array.push(blobBin.charCodeAt(i));
    }
    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
    var formdata = new FormData();	// formData 생성
    formdata.append("file", file, "image.png");	// file data 추가

    let dyBoardTitle = document.getElementById('dyBoardTitle').value;
    let dyBoardContent = document.getElementById('dyBoardContent').value;

    formdata.append('dyBoardTitle', dyBoardTitle);
    formdata.append('dyBoardContent', dyBoardContent);

    console.log(formdata.get("file"));
    console.log(formdata.get("dyBoardTitle"));
    console.log(formdata.get("dyBoardContent"));

    $.ajax({
        type : 'post',
        url : '/diaryInsert.bo',
        data : formdata,
        processData : false,	// data 파라미터 강제 string 변환 방지!!
        contentType : false,	// application/x-www-form-urlencoded; 방지!!
        success : function (data) {
            console.log(data);
        }, error : function() {
			console.log("실패");
		}
    });
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

const todayTime = () => {

var now = new Date();
var year = now.getFullYear();
var month = now.getMonth() + 1;
var date = now.getDate();
var day = now.getDay();

 var days = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
 var dayName = days[day];

	return {
        year: year,
        month: month,
        date: date,
        day: dayName
    };
};

const updateYear = () => {
    document.getElementById("year").textContent = todayTime().year;
};
updateYear();

const updateMonth = () => {
    document.getElementById("month").textContent = todayTime().month;
};
updateMonth();

const updateDate = () => {
    document.getElementById("date").textContent = todayTime().date;
};
updateDate();


const updateDay = () => {
    document.getElementById("day").textContent = todayTime().day;
};
updateDay();


