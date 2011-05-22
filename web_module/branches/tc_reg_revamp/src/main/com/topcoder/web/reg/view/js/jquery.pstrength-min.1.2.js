(function(A){A.extend(A.fn,{pstrength:function(B){var B=A.extend({colors:["#f00","#c06","#f60","#3c0","#3f0"],scores:[10,15,30,40],fullWidth:200,common:["password","sex","god","123456","123","liverpool","letmein","qwerty","monkey"],minchar:7},B);return this.each(function(){var C=A(this).attr("id");A(this).after("<div class=\"pstrength-bar\" id=\""+C+"_bar\" style=\"border: 1px solid white; font-size: 1px; height: 6px; width:0px;\"></div>");A(this).keyup(function(){A.fn.runPassword(A(this).val(),C,B)})})},runPassword:function(D,F,C){nPerc=A.fn.checkPassword(D,C);var B="#"+F+"_bar";var E="#"+F+"_text";if(nPerc==-200){strColor="#f00";A(B).css({width:C.fullWidth*0.1+"px"})}else{if(nPerc<0&&nPerc>-199){strColor="#ccc";A(B).css({width:C.fullWidth*0.2+"px"})}else{if(nPerc<=C.scores[0]){strColor=C.colors[0];A(B).css({width:C.fullWidth*0.3+"px"})}else{if(nPerc>C.scores[0]&&nPerc<=C.scores[1]){strColor=C.colors[1];A(B).css({width:C.fullWidth*0.4+"px"})}else{if(nPerc>C.scores[1]&&nPerc<=C.scores[2]){strColor=C.colors[2];A(B).css({width:C.fullWidth*0.5+"px"})}else{if(nPerc>C.scores[2]&&nPerc<=C.scores[3]){strColor=C.colors[3];A(B).css({width:C.fullWidth*0.75+"px"})}else{strColor=C.colors[4];A(B).css({width:C.fullWidth*0.92+"px"})}}}}}}
A(B).css({backgroundColor:strColor});},checkPassword:function(C,B){var F=0;if(C.length<B.minchar){F=(F-100)}else{if(C.length>=B.minchar&&C.length<=(B.minchar+2)){F=(F+6)}else{if(C.length>=(B.minchar+3)&&C.length<=(B.minchar+4)){F=(F+12)}else{if(C.length>=(B.minchar+5)){F=(F+18)}}}}
if(C.match(/[a-z]/)){F=(F+1)}
if(C.match(/[A-Z]/)){F=(F+5)}
if(C.match(/\d+/)){F=(F+5)}
if(C.match(/(.*[0-9].*[0-9].*[0-9])/)){F=(F+7)}
if(C.match(/.[!,@,#,$,%,^,&,*,?,_,~]/)){F=(F+5)}
if(C.match(/(.*[!,@,#,$,%,^,&,*,?,_,~].*[!,@,#,$,%,^,&,*,?,_,~])/)){F=(F+7)}
if(C.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)){F=(F+2)}
if(C.match(/([a-zA-Z])/)&&C.match(/([0-9])/)){F=(F+3)}
if(C.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)){F=(F+3)}
for(var D=0;D<B.common.length;D++){if(C.toLowerCase()==B.common[D]){F=-200}}
return F}})})(jQuery)