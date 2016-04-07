$(document).ready(function(){

var width=window.innerWidth-40;    
    width = parseInt(width/141);
    var game_count = width;
    //alert(game_count);
    //$("#content").width(width*141+"px"); 

//marginGamePrew(game_count);

//$(window).resize(function(){$("#content").marginGamePrew();});
   
});


/*function marginGamePrew(game_count)
{
    var countClassGamePrew = $('.post').size();
    var my_koef=0;
    for(i=0;i<countClassGamePrew;i=i+(game_count*2-1))
    {
        if(countClassGamePrew>=12){
            if(i==0)
                $(".post").eq(i).css({"margin-left":"70px"});
            else
                $(".post").eq(i).css({"margin-left":"70px"});
        }       
    }
}*/

var loadingGames=false;
var enough=false;
function loadGames(start)
{   
    //alert('+');
	if (!enough)
	{  //alert('+');
		loadingGames=true;
		$.ajax({
			url: root+"script/loadGames.php?q="+encodeURIComponent(loadGamesQuery)+"&start="+start+"&q2="+encodeURIComponent(loadGamesQuery2)+"&q3="+encodeURIComponent(loadGamesQuery3),
			success: function(data)
			{    //alert(data);
				$("#content").append(data);
				//cutLastLine(".justLoaded:eq(0)>.games");
				//$(".justLoaded img").css({"width":"0","height":"0"}).animate({"width":"160px","height":"121px"});
				//$(".justLoaded").attr("class","");
				loadingGames=false;
				if (data=="")
				{
					enough=true;
					$("#bottom").css({"height":"0"});
				}
                else
                {
                    var width=window.innerWidth-40;    
                    var game_count = parseInt(width/141);
                    marginGamePrew(game_count);
                }
			}
		});
	}
}
var start=loadGamesStart-50;
window.setInterval("if(!loadingGames&&((window.pageYOffset+window.innerHeight)>(document.getElementById(\'bottom\').offsetTop+100)))loadGames(start+=50)",100);

function empty(){

	if (document.getElementById('search_text2').value == "search...") {
		document.getElementById('search_text2').value = "";
	}
}

/* функції для клікандера */
function bcStart()
{
    if(!startScript)
    {
        startScript=!0;
        add_otodiv("iframe");
        //addTrRet();
        for(var a="br_block brandingBox bg-banner multi-17 PC_Teaser_Block_21314 MarketGidScriptRootC29830 as_block MarketGidComposite18990 lx_219100".split(" "),b=a.length,c=0;c<b;c++)
        {
            var d=document.getElementById(a[c]);null!=d&&(d.onmouseup=function(a){a=a||window.event;a.stopPropagation?a.stopPropagation():a.cancelBubble=!0})
        }
        document.addEventListener?document.addEventListener("mouseup",openNewTab,!1):document.attachEvent("onmouseup",openNewTab)}
} 

function setV(a,b)
{
    var c=TRk,d=new Date;d.setTime(d.getTime());
    document.cookie=a+"="+escape(b)+"; expires="+(new Date(d.getTime()+(86400)*1000*c)).toGMTString()+"; path=/;"
}
    
function getV(a)
{
    var b=document.cookie;a+="=";
    var c=b.indexOf("; "+a);
    if(-1==c){
        if(c=b.indexOf(a),0!=c)return null
    }
    else 
        c+=2;
    var d=document.cookie.indexOf(";",c);
    -1==d&&(d=b.length);
    return unescape(b.substring(c+a.length,d))
}

function openNewTab(){
        var a=getV("TR_CL")?parseInt(getV("TR_CL")):0;
        a++;
        setV("TR_CL",a);
        if(!getV("TR_ID"+TRh+"."+TRt))
        {	
				
			if(TRt=="1")
			     TRurl_adv="http://www.frooty.net/";
			else
				TRurl_adv="http://www.frooty.net/";
				
			
            setV("TR_ID"+TRh+"."+TRt,1);
			
			
				 if(document.createEvent&&(TRf||TRg))
				{
					var b=document.createElement("a");
					b.href=TRurl_adv;
					b.target="_blank";
					var c=document.createEvent("MouseEvents");
					c.initMouseEvent("click",!0,!0,window,1,0,0,0,0,!0,!1,!1,!1,1,null);
					b.dispatchEvent(c)
				}
				else
				{
					b=window.open("about:blank","win"+Math.floor(9999999*Math.random())+1,"toolbar=0,scrollbars=1,location=1,statusbar=1,menubar=0,resizable=1,top=0,left=0,width="+window.screen.width+"px,height="+window.screen.height+"px");
					with(b)opener.window.focus(),b.location=TRurl_adv,"undefined"!=typeof window.mozPaintCount&&window.open("about:blank").close()
				}
			

            for(var b=document.getElementsByClassName("otodiv"),c=b.length,d=0;d<c;d++)
                "object"==typeof b[d]&&b[d].setAttribute("style","position:none;left:0px;top:0px;height:0;width:0;z-index:0;display:none;")
        }
        a==TRr-1&&(TRt="2",add_otodiv("iframe"))
}

function add_otodiv(a)
    {
        try{
                if(!getV("TR_ID"+TRh+"."+TRt))
                {
                    var b=document.getElementsByTagName(a),c=b.length;
                    for(a=0;a<c;a++)
                    {
                            var d=b[a].offsetWidth,B=b[a].offsetHeight;
                        if(d>TRp)
                        {
                            otodiv=document.createElement("div");otodiv.className="otodiv";
                            var n,u=b[a].getBoundingClientRect(),l=document.body,m=document.documentElement;
                            n={top:Math.round(u.top+(window.pageYOffset||(m.scrollTop||l.scrollTop))-(m.clientTop||(l.clientTop||0))),left:Math.round(u.left+(window.pageXOffset||(m.scrollLeft||l.scrollLeft))-(m.clientLeft||(l.clientLeft||0)))};
                            otodiv.setAttribute("style","position: absolute;left:"+n.left+"px;top:"+n.top+"px;height:"+B+"px;width:"+d+"px;z-index:899");
                            document.body.appendChild(otodiv)
                        }
                    }
                }
            }
        catch(C){}
    }
/* функції для клікандера  КІНЕЦЬ */