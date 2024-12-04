<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Document</title>
			<!-- jQuery -->
			<script src="https://code.jquery.com/jquery-3.7.1.min.js"
				integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
			<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.min.js"
				integrity="sha256-Fb0zP4jE3JHqu+IBB9YktLcSjI1Zc6J2b6gTjB0LpoM=" crossorigin="anonymous"></script>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/announcementInformation2.css">
			<script src="${pageContext.request.contextPath}/js/announcementInformation2.js" defer></script>
		</head>

		<body onload="init('${pageContext.request.contextPath}')">
			<div class="nomodal">
				<div id="Job_Announcement_Information">
					<div id="announcement_Information">
						<h2>채용 공고 등록</h2>
						<div id="preview_and_TemporarySave">
							<button id="preview">미리 보기</button>
							<button id="TemporarySave">임시 저장</button>
						</div>
					</div>

					<hr>

					<div id="Job_Announcement_Information_content">
						<div id="Job_Announcement_Information_Index">
							<div id="Job_Announcement_Information_Index_One">
								<img src="${pageContext.request.contextPath}/img/icons8-1-24.png">
								<p>기업 정보</p>
								<hr>
								<img src="${pageContext.request.contextPath}/img/icons8-2-48.png">
								<p>공고 정보</p>
							</div>
						</div>

						<div class="Contact_Announcement_Information">
							<div class="Contact_Announcement_Information_Title">
								<h2>공고 지원 방식</h2>
								<b>
									<p style="color: #FE0000; font-weight: 900;">*</p>
								</b>
							</div>
						</div>

						<div class="radio_label">
							<div id="WorkDream_Applied">
								<input type="radio" name="workdream" id="WorkDream_Applied_input"
									value="WorkDream_Applied_input" name="Method" checked> <label
									for="WorkDream_Applied_input">
									<h2>워크드림 프로필로 간편 지원</h2>
								</label>
							</div>
							<div id="Homepage_Applied">
								<input type="radio" name="workdream" id="Homepage_Applied_input"
									value="Homepage_Applied_input" name="Method"> <label for="Homepage_Applied_input">
									<h2>자사 홈페이지에서 지원</h2>
								</label>
							</div>
						</div>

						<div class="Contact_Announcement_Information_Title">
							<h2>제목</h2>
							<b>
								<p style="color: #FE0000; font-weight: 900;">*</p>
							</b>
						</div>

						<input id="Announcement_Title" type="text"
							onkeyup="checkTextLength(event); changeValue('title', this.value)"
							placeholder="공고 제목을 입력해주세요." name="title">
						<div style="display: flex;">
							<p style="color: #000000; font-weight: 900; margin-top: 3px; margin-bottom: 1px;">*
								25자 이내의 글자 수를 입력해주세요.</p>
						</div>
						<div id="charCount"
							style="font-size: 0.8rem; color: #757575; margin-bottom: 40px; margin-left: 5px;">현재
							글자 수: 0/25</div>

						<div class="Contact_Announcement_Information_Title">
							<h2>직무</h2>
							<b>
								<p style="color: #FE0000; font-weight: 900;">*</p>
							</b>
						</div>
						<p style="margin-top: 0px; color: #757575; font-weight: 200;">최대
							5개까지 추가 가능합니다.</p>

						<main>
							<section>
								<div id="duty-list-area">

								</div>

								<button class="Add_Duty" id="addDutyButton" style="backgroundcolor: none;">
									<img src="${pageContext.request.contextPath}/img/free-icon-plus-3524388.png"
										alt="추가" />
									<p>직무 추가</p>
								</button>
							</section>
						</main>

						<div class="Contact_Announcement_Information_Title">
							<h2>공고 소개 이미지</h2>
						</div>
						<div id="Announcement_Introduction_img">
							<img src="${pageContext.request.contextPath}/img/icons8-img-48.png">
						</div>
						<div id="Announcement_Introduction_file">
							<input type="text" id="Announcement_Introduction_fileName" placeholder=".png" disabled>
							<input type="file" id="Announcement-file" hidden onchange="changeFile(this)">
							<label for="Announcement-file" id="Announcement_custom-file-upload">파일첨부</label>
						</div>
						<p style="color: #000000; font-weight: 900; margin-bottom: 2px;">*
							공고와 관련된 이미지를 올려주세요. 소개문 이전에 노출됩니다. 공고와 관련없는 이미지는 제지를 받을 수 있습니다.</p>
						<p style="color: #000000; font-weight: 900; margin-top: 2px; margin-bottom: 40px;">*
							최소 1200 x 800px 이상, 3:2 비율의 이미지</p>

						<div class="Contact_Announcement_Information_Title">
							<h2>공고 소개</h2>
						</div>
						<textarea class="Text_Container" placeholder="회사나 제품 / 서비스 또는 공고에 대한 소개를 작성해주세요."
							name="introduction" onkeyup="changeValue('introduction', this.value)"></textarea>

						<div class="Contact_Announcement_Information_Title">
							<h2>주요 업무</h2>
						</div>
						<textarea class="Text_Container" placeholder="해당 포지션에서 어떤 업무를 하는지 작성해주세요." name="major"
							onkeyup="changeValue('major', this.value)"></textarea>

						<div class="Contact_Announcement_Information_Title">
							<h2>자격 요건</h2>
						</div>
						<textarea class="Text_Container" placeholder="업무상 꼭 필요한 필수 요건을 작성해 주세요." name="qualification"
							onkeyup="changeValue('qualification', this.value)"></textarea>

						<div class="Contact_Announcement_Information_Title">
							<h2>우대 사항</h2>
						</div>
						<textarea class="Text_Container" placeholder="우대하는 요건을 작성해 주세요." name="Preferential"
							onkeyup="changeValue('preferential', this.value)"></textarea>

						<div class="Contact_Announcement_Information_Title">
							<h2>채용 절차</h2>
						</div>
						<textarea class="Text_Container" placeholder="서류 전형, 면접 등 채용 절차를 작성해 주세요." name="recruitment"
							onkeyup="changeValue('recruitment', this.value)"></textarea>

						<div class="Contact_Announcement_Information_Title">
							<h2>기타 안내</h2>
						</div>
						<textarea class="Text_Container" style="margin-bottom: 80px;"
							placeholder="복지 및 해택 등 알리고 싶은 기타 정보를 작성합니다." name="other"
							onkeyup="changeValue('other', this.value)"></textarea>

						<div class="Contact_Announcement_Information_Title">
							<h2 style="margin-bottom: 20px;">공고 게시 기간</h2>
						</div>
						<div id="Announcement_Post_Time">
							<input type="datetime-local" id="Post_First_Time" name="period_time_min"
								onchange="changeValue('period_time_min', this.value)">
							<p style="margin-bottom: 10px;">~</p>
							<input type="datetime-local" id="Post_End_Time" name="period_time_max"
								onchange="changeValue('period_time_max', this.value)">
						</div>

						<div class="Contact_Announcement_Information_Title">
							<h2>지원자가 필수로 입력해야 하는 정보</h2>
						</div>
						<p style="margin-top: 3px; color: #A09F9F; font-size: 0.9rem;">필수
							입력 정보가 적을수록, 지원 허들이 낮아져요</p>

						<hr style="border: 1px solid #9E9E9E;">

						<div class="Contact_Announcement_Information_Title" style="padding: 35px 0;">
							<h2 style="padding: 0 20px; width: 150px;">자격요건</h2>
							<div class="Need_Input_Infomation">
								<label class="Check_And_Text" style="width: 90px; padding-left: 0px;">
									<input type="checkbox" data-key="qualification" value="외국어 능력">외국어 능력
								</label>
								<label class="Check_And_Text" style="width: 60px; padding-left: 0px;">
									<input type="checkbox" data-key="qualification" value="자격증">자격증
								</label>
								<label class="Check_And_Text" style="width: 85px; padding-left: 0px;">
									<input type="checkbox" data-key="qualification" value="포트폴리오">포트폴리오
								</label>
							</div>
						</div>

						<hr style="border: 1px solid #9E9E9E;">

						<div class="Contact_Announcement_Information_Title" style="padding: 35px 0;">
							<h2 style="padding: 0 20px; width: 150px;">우대사항</h2>
							<div class="Need_Input_Infomation">
								<label class="Check_And_Text" style="padding-left: 0px;">
									<input type="checkbox" data-key="applicants_preferential" value="보훈 여부">보훈 여부
								</label>
								<label class="Check_And_Text" style="padding-left: 0px;">
									<input type="checkbox" data-key="applicants_preferential" value="장애 여부">장애 여부
								</label>
								<label class="Check_And_Text" style="padding-left: 0px;">
									<input type="checkbox" data-key="applicants_preferential" value="병역 정보">병역 정보
								</label>
							</div>
						</div>

						<hr style="border: 1px solid #9E9E9E;">

						<div class="Contact_Announcement_Information_Title" style="padding: 35px 0;">
							<h2 style="padding: 0 20px; width: 150px;">개인정보</h2>
							<div class="Need_Input_Infomation">
								<label class="Check_And_Text" style="padding-left: 0px;">
									<input type="checkbox" data-key="information" value="출생연도">출생연도
								</label>
								<label class="Check_And_Text" style="width: 50px; padding-left: 0px;">
									<input type="checkbox" data-key="information" value="성별">성별
								</label>
								<label class="Check_And_Text" style="padding-left: 0px;">
									<input type="checkbox" data-key="information" value="현재연봉">현재연봉
								</label>
							</div>
						</div>


						<hr style="border: 1px solid #9E9E9E; margin-bottom: 70px;">


					</div>
					<div id="Job_Posting_division_zones"></div>

					<div class="Next_Or_Back">
						<button class="Cancel_Push">취소</button>
						<button class="Next_Push">다음</button>
					</div>
				</div>

				<!-- 모달 -->
				<div class="modal">
					<div class="modal_popup">
						<div id="Job_Position_content">
							<div class="Position_And_Career">
								<div class="radio_label">
									<div class="Position_And_Career_Title">
										<h2>직급 및 직책</h2>
										<b>
											<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
										</b>
									</div>

									<div id="Rank_And_Position">
										<input type="text" id="Rank" name="Rank" placeholder="직급을 선택해 주세요."
											onkeyup="changeValue('rank', this.value)"> <input type="text" id="Position"
											name="Position" placeholder="직책을 선택해 주세요."
											onkeyup="changeValue('position', this.value)">
									</div>

									<div class="Position_And_Career_Title">
										<h2>고용 형태</h2>
										<b>
											<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
										</b>
									</div>

									<div id="Employment_Type">
										<div>
											<input type="radio" id="fullTime" name="employment_type" value="정규직"
												checked /> <label for="fullTime">정규직</label>
										</div>
										<div>
											<input type="radio" id="contract" name="employment_type" value="계약직" />
											<label for="contract">계약직</label>
										</div>
									</div>


									<div class="Position_And_Career_Title">
										<h2>경력</h2>
										<b>
											<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
										</b>
									</div>

									<div id="Career">
										<div>
											<input type="radio" id="Newcomer" name="career_type" value="신입">
											<label for="Newcomer">신입</label>
										</div>
										<div>
											<input type="radio" id="Work_History" name="career_type" value="경력"> <label
												for="Work_History">경력</label>
										</div>
										<div>
											<input type="radio" id="Regardless_Of_Experience" name="career_type"
												value="경력 무관" checked> <label for="Regardless_Of_Experience">경력
												무관</label>
										</div>
									</div>

									<div id="Career_Year">
										<input type="text" class="Career_Year_Min" name="career_year_min"
											placeholder="최소" onkeyup="changeValue('career_year_min', this.value)">
										<p style="font-size: 0.9rem; font-weight: 700;">~</p>
										<input type="text" class="Career_Year_Max" name="career_year_max"
											placeholder="최대" onkeyup="changeValue('career_year_max', this.value)">
										<p style="font-size: 0.9rem; font-weight: 700;">년차</p>
									</div>

									<div class="Position_And_Career_Title">
										<h2>학력</h2>
										<b>
											<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
										</b>
									</div>

									<div id="Education">
										<div>
											<input type="radio" id="Academic" name="academic" value="학력무관" checked>
											<label for="Academic">학력무관</label>
										</div>
										<div>
											<input type="radio" id="High_School_Graduate" name="academic"
												value="고등학교 졸업"> <label for="High_School_Graduate">고등학교
												졸업</label>
										</div>
										<div>
											<input type="radio" id="College_Graduate2" name="academic"
												value="대학졸업(2,3년)"> <label for="College_Graduate2">대학졸업(2,3년)</label>
										</div>
										<div>
											<input type="radio" id="College_Graduate4" name="academic" value="대학졸업(4년)">
											<label for="College_Graduate4">대학졸업(4년)</label>
										</div>
										<div>
											<input type="radio" id="University_Master_Graduate" name="academic"
												value="대학원 석사졸업"> <label for="University_Master_Graduate">대학원
												석사졸업</label>
										</div>
										<div>
											<input type="radio" id="PhD_Graduate" name="academic" value="대학원 박사졸업">
											<label for="PhD_Graduate">대학원
												박사졸업</label>
										</div>
									</div>

									<div class="Position_And_Career_Title">
										<h2>근무요일</h2>
										<b>
											<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
										</b>
									</div>

									<div id="Work_Days">
										<div>
											<input type="radio" id="6-Day_Work_Week" name="work_days" value="주 6일">
											<label for="6-Day_Work_Week">주 6일</label>
										</div>
										<div>
											<input type="radio" id="5-Day_Work_Week" name="work_days" value="주 5일"
												checked> <label for="5-Day_Work_Week">주
												5일</label>
										</div>
										<div>
											<input type="radio" id="4-Day_Work_Week" name="work_days" value="주 4일">
											<label for="4-Day_Work_Week">주 4일</label>
										</div>
										<div>
											<input type="radio" id="3-Day_Work_Week" name="work_days" value="주 3일">
											<label for="3-Day_Work_Week">주 3일</label>
										</div>
										<div>
											<input type="radio" id="2-Day_Work_Week" name="work_days" value="주 2일">
											<label for="2-Day_Work_Week">주 2일</label>
										</div>
										<div>
											<input type="radio" id="1-Day_Work_Week" name="work_days" value="주 1일">
											<label for="1-Day_Work_Week">주 1일</label>
										</div>
										<div>
											<input type="radio" id="Negotiable_Work" name="work_days" value="협의,스케줄 근무">
											<label for="Negotiable_Work">협의,스케줄
												근무</label>
										</div>
									</div>

								</div>

								<div class="Position_And_Career_Title">
									<h2>근무시간</h2>
									<b>
										<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
									</b>
								</div>

								<div id="Wark_Time" style="margin-bottom: 5px;">
									<input type="time" class="Wark_Time_Min"
										onchange="changeValue('work_time_min', this.value)">
									<p style="font-size: 0.9rem; font-weight: 900;">~</p>
									<input type="time" class="Wark_Time_Min"
										onchange="changeValue('work_time_max', this.value)">
									<p style="font-size: 0.9rem; font-weight: 700;">까지</p>
								</div>

								<div style="display: flex; margin-bottom: 10px; margin-top: 5px;">
									<!-- 협의, 스케쥴 근무 -->
									<label class="unstyled-label">
										<input type="checkbox" style="font-weight: 900; font-size: 15px;">
										<p style="font-size: 12px; font-weight: 600; margin: 0;">협의, 스케쥴 근무</p>
									</label>
								</div>

								<div class="Position_And_Career_Title">
									<h2>예상연봉</h2>
									<b>
										<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
									</b>
								</div>

								<div id="Expected_Salary" style="margin-bottom: 0px;">
									<input type="text" class="Expected_Salary_Min" name="expected_salary_min"
										placeholder="최소" onkeyup="changeValue('expected_salary_min', this.value)">
									<p style="font-size: 0.9rem; font-weight: 900;">~</p>
									<input type="text" class="Expected_Salary_Max" name="expected_salary_max"
										placeholder="최대" onkeyup="changeValue('expected_salary_max', this.value)">
									<p style="font-size: 0.9rem; font-weight: 900;">만원</p>
								</div>

								<div style="display: flex; margin-bottom: 10px; margin-top: 5px;">
									<!-- 채용시 협의 -->
									<label class="unstyled-label">
										<input type="checkbox" name="" style="font-weight: 900; font-size: 15px;">
										<p style="font-size: 12px; font-weight: 600; margin: 0;">채용시 협의</p>
									</label>
								</div>

								<div class="Position_And_Career_Title">
									<h2>근무지 주소</h2>
									<b>
										<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
									</b>
								</div>

								<div style="display: flex;">
									<button class="Work_Location_Address">
										<img src="${pageContext.request.contextPath}/img/free-icon-plus-3524388.png">
										<p>지역 선택</p>
									</button>
									<div id="location-container">
										<!-- 새로운 Work_Location 버튼이 추가될 곳 -->
									</div>
								</div>

								<div class="Position_And_Career_Title">
									<h2 style="font-size: 1.5rem; font-weight: 900; margin-bottom: 20px;">선호
										경력</h2>
								</div>

								<div class="Position_And_Career_Title">
									<h2>업종</h2>
									<b>
										<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
									</b>
								</div>

								<div style="display: flex;">
									<button class="Industry_Category">
										<img src="${pageContext.request.contextPath}/img/free-icon-plus-3524388.png">
										<p>업종 추가</p>
									</button>
									<div id="industry-container">
										<!-- 새로운 Industry_Type 버튼이 추가될 곳 -->
									</div>
								</div>


								<div class="Position_And_Career_Title">
									<h2>전문분야 및 스킬</h2>
									<b>
										<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
									</b>
								</div>

								<div id="Skill_Search">
									<img src="${pageContext.request.contextPath}/img/icons8-search-24.png"
										id="search_Icon"> <img
										src="${pageContext.request.contextPath}/img/icons8-vertical-line-16.png"
										id="Vertical_Line"> <input type="text" placeholder="키워드로 전문분야 - 스킬을 검색하세요"
										id="Skill_Search_Keyward">
								</div>

								<p style="font-size: 0.8rem; color: #656565;">추천 스킬을 선택해보세요</p>

								<div id="skill-container">
									<!-- 키워드가 추가될 곳 -->
								</div>


								<hr>

								<div class="Position_And_Career_Title" style="margin-top: 20px; margin-bottom: 30px;">
									<h2 style="font-size: 1.5rem;">선호 기업</h2>
								</div>

								<div class="Position_And_Career_Title" style="margin-bottom: 0px;">
									<h2>기업 유형</h2>
								</div>
								<p style="color: #656565; margin-top: 5px; margin-bottom: 20px;">특정
									기업 유형의 과거•현재 재직자에게 우선적으로 노출하고 싶다면 입력해주세요</p>


								<div class="radio_label">
									<div id="Business_Type">
										<div>
											<input type="radio" id="Enterprise" name="company_type" value="대기업" checked>
											<label for="Enterprise">대기업</label>
										</div>
										<div>
											<input type="radio" id="Medium-sized_Enterprise" name="company_type"
												value="중견기업"> <label for="Medium-sized_Enterprise">중견기업</label>
										</div>
										<div>
											<input type="radio" id="Small_and_Medium_Enterprise" name="company_type"
												value="중소기업"> <label for="Small_and_Medium_Enterprise">중소기업</label>
										</div>
										<div>
											<input type="radio" id="Startup" name="company_type" value="스타트업"> <label
												for="Startup">스타트업</label>
										</div>
										<div>
											<input type="radio" id="Foreign_Company" name="company_type" value="외국계기업">
											<label for="Foreign_Company">외국계기업</label>
										</div>
									</div>

									<div class="Position_And_Career_Title" style="margin-bottom: 0px;">
										<h2>특정기업</h2>
									</div>
									<p style="color: #656565; margin-top: 5px; margin-bottom: 20px;">특정
										기업의 과거•현재 재직자에게 우선적으로 노출하고 싶다면 입력해주세요</p>

									<div style="display: flex;">
										<button class="add-company-btn">
											<img
												src="${pageContext.request.contextPath}/img/free-icon-plus-3524388.png">
											<p>기업 추가</p>
										</button>
										<div id="company-container">
											<!-- 새로운 Company_Type 버튼이 추가될 곳 -->
										</div>
									</div>

									<div id="Employment_Status_with_Preferred_Company">
										<div class="Position_And_Career_Title">
											<h2>선호 기업에 대한 재직 여부</h2>
											<b>
												<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
											</b>
										</div>

										<div style="display: flex; justify-content: space-between;">
											<div class="Currently_Employed">
												<div class="Employment_Status">
													<div>
														<input type="radio" id="Currently_Employed"
															name="employment_status" value="재직중"> <label
															for="Currently_Employed">재직중</label>
													</div>
												</div>

												<p style="margin-left: 35px;">기업 유형•특정 기업의 재직자를 타겟팅합니다</p>
											</div>

											<div class="Currently_Employed">
												<div class="Employment_Status">
													<div>
														<input type="radio" id="Regardless_Of_Employment"
															name="employment_status" value="재직무관" checked> <label
															for="Regardless_Of_Employment">재직무관</label>
													</div>
												</div>

												<p style="margin-left: 35px;">과거•현재 재직자를 함께 타겟팅합니다</p>
											</div>
										</div>
									</div>
								</div>

								<div style="width: 89%; display: flex; margin-top: 15px; justify-content: end;">
									<button id="Confirm" class="close_btn" onclick="closeModal()">확인</button>
								</div>

							</div>
						</div>

					</div>
				</div>
		</body>

		</html>