  function submitEnter(e, loginForm) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     loginForm.submit();
     return false;
    } else return true;
  }

  function clearForm(form){
    for(i=0;i<form.elements.length; ++i) {
      if( form.elements[i].type == 'text' || form.elements[i].type == 'password' ) {
        form.elements[i].value= '';
      }
      else if( form.elements[i].type == 'select-one' ) {
        form.elements[i].selectedIndex = 0;
      }
      else if( form.elements[i].type == 'checkbox' ) {
        form.elements[i].checked=false;
      }
    }
  }
