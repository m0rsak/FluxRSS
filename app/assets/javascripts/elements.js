function changeCSS(id,str) {
  if (str == false){
    $("#article_"+id).removeClass("notRead");
  }else{
    $("#article_"+id).addClass("notRead");
  }
}


