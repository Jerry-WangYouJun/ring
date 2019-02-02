function setCheckbox(dic , val){
	 $(".dicCheckbox").each(function(){
		 var field = $(this).attr("name");
		 var htmlStr = "";
		 val = $(this).attr("value");
			if (dic.hasOwnProperty(field)) {
				for ( var keyValue in dic[field]) {
					htmlStr += ' <label class="checkbox-inline"> <input type="checkbox"  value="'
						+ dic[field][keyValue].describ + '" name="' + field +'"  ' 
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