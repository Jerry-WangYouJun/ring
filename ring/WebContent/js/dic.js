function setCheckbox(dic , val){
	 $(".dicCheckbox").each(function(){
		 var field = $(this).attr("name");
		 var htmlStr = "";
			if (dic.hasOwnProperty(field)) {
				for ( var keyValue in dic[field]) {
					htmlStr += ' <label class="checkbox-inline"> <input type="checkbox"  value="'
						+ dic[field][keyValue].describ + '" name="custLoca"  ' 
						if(val.indexOf(dic[field][keyValue].describ ) != -1){
							htmlStr +=  'checked="checked" >' 
						}else{
							htmlStr +=  '>'
						}
					htmlStr +=  dic[field][keyValue].describ + '</label>'
				}
			}
			$(this).append(htmlStr);
	 });
}