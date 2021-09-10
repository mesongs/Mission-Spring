<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>





<section id="categoryAjax">
								<div class="row">
									<div class="col-2">
										<select name="receiptKind" id="receiptKind" style="width: 150px; margin-bottom: 20px; color:#495057; height: 35px;border-top-width: 0px;padding-bottom: 0px; border-radius: 5px 5px 5px 5px; ">
											<option value="">영수증 구분</option>
											<option value="1">세금계산서</option>
											<option value="2">계산서</option>
											<option value="3">카드영수증</option>
											<option value="4">간이영수증</option>
										</select>
									</div>
									<div class="col-2">
										<select name="receiptKind" id="receiptKind" style="width: 150px; margin-bottom: 20px; color: #495057; height: 35px; border-top-width: 0px;padding-bottom: 0px; border-radius: 5px 5px 5px 5px; " >
											<option value="">중복여부</option>
											<option value="1">중복의심</option>
											<option value="2">중복아님</option>
										</select>
									</div>
									<div class="col" style="width: 200px">
										<div>
											<input type="search" placeholder="검색어 입력" name="searchWord" id="searchWord" value="" style="float: left; width: 150px; ">
											<span style="float: left">
											<button id="searchBtn" type="submit">검색</button>
											</span>
										</div>
										
									</div>
									<div class="col" align="right">
											  	<button type="submit" id="excelBtn" style="padding-left: 0px;"><img class="product-img" src="${ pageContext.request.contextPath }/resources/img/excel.png">Excel 다운로드</button>
									</div>
								</div>
							</section>
				