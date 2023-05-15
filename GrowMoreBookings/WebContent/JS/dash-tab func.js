

/**
 * Functionalities for the Dashboard JSP file
 */

let oOrC = true;
let finish;
function showMain(){
	let nav = document.getElementById('nav');
	let screen = document.getElementById('body').scrollWidth;
	let width = nav.scrollWidth;
	let ch = width / 5;
	let pos;
	let inter;
	finish = false;
	
	console.log(screen);
	
	//For Opening the Menu
	if(oOrC && !(finish)){
		pos = 0;
		if(screen <= 750){
			document.getElementById('frame').style.display = 'block';
			nav.style.display = 'none';
		}
		else{
			inter = setInterval(function(){
				if(pos == (-(width))){
					clearInterval(inter);
					finish = true;
				}
				else{
					pos -= ch;
					nav.style.marginLeft = pos + 'px';
				}
			}, 10);
		}
		document.getElementById('frame').style.display = 'block';
		document.getElementById('t-bars').style.display = 'block';
		document.getElementById('cross').style.display = 'none';
		oOrC = false;
	}
	//For Hiding the Menu:
	else if(!(finish)){
		pos = (-(width));
		if(screen <= 750){
			document.getElementById('frame').style.display = 'none';
			nav.style.display = '';
		}
		else{
			inter = setInterval(function(){
			if(pos == 0){
				clearInterval(inter);
				finish = true;
			}
			else{
				pos += ch;
				nav.style.marginLeft = pos + 'px';
			}
		}, 10);
		}
		document.getElementById('frame').style.display = 'block';
		document.getElementById('t-bars').style.display = 'none';
		document.getElementById('cross').style.display = 'block'; 
		nav.style.position = 'none';
		oOrC = true;
	}
	
}

function change(link){
	if(document.getElementById('body').scrollWidth <= 750){
		showMain();
	}
	let frame = document.getElementById('frame');
	frame.src = link;
}

//End of Dashboard JSP functionalities

//---------------------------------------------------------------------------------------------------//

/**
 *	Functionalitites for other tabs, which have ts and other functions
 */

function colorRow(e){
	let t = document.getElementById('table');
	
	for(let i = 0; i < t.rows[0].cells.length; i++){
		t.rows[0].cells[i].style.backgroundColor = '#ededed';
	}
	
	for(let i = 0; i < t.rows.length; i++){
		t.rows[i].style.backgroundColor = 'transparent';
	}
	
	t.rows[0].cells[e.cellIndex].style.backgroundColor = '#d4d4d4';
	t.rows[e.parentElement.rowIndex].style.backgroundColor = '#d4d4d4';
}

function detectChange(o){
	let i = document.getElementsByName('changeInformer')[0];
	let str = i.value;					//str = 'first,last'
	let name = o.name;					//name = 'username'
	if(!str.includes(name))				//str.includes(name) = false
	{
		if(str === ''){
			i.value = name;
		}
		else{
			i.value = name + ',' + str;//'username,first,last'
		}
	}
}

function Search(col){
  let input = document.getElementById("search");
  let filter = input.value.toUpperCase();
  let table = document.getElementById("table");
  let tr = table.getElementsByTagName("tr");
  
  let td;
  let txtValue;

  for (let i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[col - 1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
