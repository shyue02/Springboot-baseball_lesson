<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
		<div class="mb-3 mt-3">
			<select id="stadiumId" class="form-control">
				<c:forEach var="stadium" items="${stadiumList}">
					<option value="${stadium.id}">${stadium.name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="mb-3 mt-3">	<!-- stadiumId랑 name을 가져와서 insert 할 거라서 stadiumId랑 name을 받는 Dto가 필요하다 -->
			<input id="name" type="text" class="form-control" placeholder="Enter teamName">
		</div>
		<button id="btnInsert" type="button" class="btn btn-primary">팀등록완료</button>
	</form>
</div>

<script>
	$("#btnInsert").click(()=>{	<!-- 이벤트리스너의 목적은 클릭되면 ~을 하겠다는 것.  -->
		insert();
	});
	
	function insert(){
		let data = {
				name: $("#name").val(),
				stadiumId: $("#stadiumId").val()
		} // data를 json으로 바꿔서 던질거라서 이걸 받을 주소가 있어야 한다 -> 컨트롤러 만들자
		$.ajax("/team",{
			type: "POST",
			dataType: "json",
			data: JSON.stringify(data), // http body에 들고갈 요청 데이터
			headers: { // http header에 들고갈 요청 데이터
				"Content-Type": "application/json; charset=utf-8"
			}
		
		}).done((res)=>{		<!-- ((CMPespDto가 담김)->{통신이 끝나면 실행}-->
			if(res.code == 1){ // 성공
				location.href="/team";
			}else{ // 실패
				alert("팀등록에 실패하였습니다.");
			}
		});
	}
</script>

<%@ include file="../layout/footer.jsp"%>