/**
 *  메인페이지의 검색창 관련 자바스크립트
 */

function check()
	{
		      if(document.searchinput.keyword.value == "")
			  {
			     alert("검색어를 입력해주세요.");
				 return false;
			  }
		   document.searchinput.submit();
	}