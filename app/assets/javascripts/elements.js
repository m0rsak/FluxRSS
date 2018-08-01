



function changeStatus(id,str) {
 
  if (str == false){
    $("#element_"+id).removeClass("notRead");
    $("#linkToRead").text("Marqué comme non lu");
  }else{
    $("#element_"+id).addClass("notRead");
    $("#linkToRead").text("Marqué comme lu");
  }

  
  
}
