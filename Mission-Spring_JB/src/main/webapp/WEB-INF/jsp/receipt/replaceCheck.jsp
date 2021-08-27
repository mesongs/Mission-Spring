<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


   <section id="categoryAjax">
								<div class="row">
									<div class="col-2">
										<select name="overlapChange" id="overlapChange" style="width: 140px; margin-bottom: 20px; color: #495057; height: 35px; border-top-width: 0px;padding-bottom: 0px; border-radius: 5px 5px 5px 5px; " >
											<option value="">중복여부 변경</option>
											<option value="1">중복의심</option>
											<option value="2">중복아님</option>
										</select>
									</div>
									<div class="col-2">  <!-- col-md-auto는 내용의 크기에 따라 컬럼 길이 자동 조절 -->
										<select name="receiptChange" id="receiptChange" style="width: 160px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; border-radius: 5px 5px 5px 5px; ">
											<option value="">영수증 구분 변경</option>
											<option value="1">세금계산서</option>
											<option value="2">계산서</option>
											<option value="3">카드영수증</option>
											<option value="4">간이영수증</option>
										</select>
									</div>
									
									<div class="col-2">
										<select name="purposeChange" id="purposeChange"  style="width: 160px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; border-radius: 5px 5px 5px 5px; margin-left: 18px;" >
											<option value="">사용목적 변경</option>
											<option value="1">재료비</option>
											<option value="2">자재비</option>
											<option value="3">식비</option>
											<option value="4">접대비</option>
											<option value="5">세금</option>
											<option value="6">인건비</option>
											<option value="7">공과금</option>
											<option value="8">기타</option>
										</select>
									</div>
									<div class="col-2" style="margin-left: 50px;">
											<button id="update" type="submit" style="border-radius: 5px 5px 5px 5px">적용</button>
											<button id="updateCancel" type="submit" style="border-radius: 5px 5px 5px 5px; margin-left: 5px;">취소</button>
									</div>
									<div class="col-2" align="right" style="margin-left: 109px;">
											<button id="delete" type="submit" style="border-radius: 5px 5px 5px 5px">영수증 삭제</button>
									 </div>
									
									
								</div>
							</section>
				