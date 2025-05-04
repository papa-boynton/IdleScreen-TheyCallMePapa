function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}


/* -------------------------------------------------------------------------- */
/*                                    Load                                    */
/* -------------------------------------------------------------------------- */
function updateClock() {
  //var idletime = RainmeterAPI.getMeasure("Idletime").();
  var today = new Date();
  // var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
  var date = (today.getMonth()+1)+'/'+today.getDate()+'/'+today.getFullYear();
  //var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
  var hr = today.getHours();
  var min =today.getMinutes();
  var sec = today.getSeconds();

  if (sec < 10) {
    sec = "0" + sec;
  }

  if (min < 10) {
    min = "0" + min;
  }

  var ampm = "AM";

  if( hr > 12 ) {
    hr -= 12;
    ampm = "PM";
  }
  var time = hr + ":" + min + ":" + sec + " " + ampm;

  // document.getElementById('details').innerHTML = 'IdleWebview v1.1 // Default style\n=================\nIdletime: +idletime+\nTime: '+time+'\nDate: '+date;
  document.getElementById('details').innerHTML = 'Time: '+time+'\nDate: '+date;

  // call this function again in 1000ms
  setTimeout(updateClock, 1000);
}

window.onload = function() {
  const transition_els = document.querySelectorAll('.transition');
  setTimeout(() => {
    for (i = 0; i < transition_els.length; ++i) {
      const transition_el = transition_els[i];
      transition_el.classList.add('is-active');
    }
  }, 500);
  updateClock(); // initial call
}

