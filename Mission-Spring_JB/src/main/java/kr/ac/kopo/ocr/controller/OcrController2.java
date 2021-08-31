package kr.ac.kopo.ocr.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;

/*
 * @Controller public class OcrController2 {
 * 
 * @RequestMapping("/ocr/list") public String generalOcr() {
 * 
 * // 비동기(execute) or 동기(enqueue) 요청을 편리하게 할 수 있음 // HttpURLConnection과
 * HttpClient에 비해 상당히 직관적이고 사용하기도 편리 // HttpURLConnection은 매번 통신을 할 때마다
 * openConnection(), disconnect() 열고 닫기 해줘야함
 * 
 * OkHttpClient client = new OkHttpClient();
 * 
 * // ModelAndView mav = new ModelAndView("ocr/getOCR");
 * 
 * MediaType mediaType = MediaType.parse("application/json");
 * 
 * RequestBody body = RequestBody.create(mediaType, "{\n\t\"version\" : \"V1\","
 * + "\n\t\"requestId\" : \"test2\"," + "\n\t\"timestamp\" : 0," +
 * "\n\t\"images\" :[{\n\t\t\n\t\t\"format\" : \"png\"," +
 * "\n\t\t\"url\" : \"https://kr.object.ncloudstorage.com/testbucke/KakaoTalk_20210815_174210497.png\","
 * + "\n\t\t\"name\" : \"KakaoTalk_20210815_174210497.png\"\n\t}]\n}");
 * 
 * Request request = new Request.Builder().url(
 * "https://55c7547061ee4d91891f615ee5e7c101.apigw.ntruss.com/custom/v1/10737/a4ea6ab1e2b24fda85a939e66443d9c380440ecaf6e6e6069e248761c5a0353b/general")
 * .post(body).addHeader("content-type", "application/json")
 * .addHeader("x-ocr-secret", "cHBIclVDQnZaV3NkQVJBUnRhaGdsaGxMTEllSEtzSkM=")
 * .addHeader("cache-control", "no-cache") // .addHeader("postman-token",
 * "31917011-c262-8273-4761-7a87eef0d3fa") .build();
 * 
 * try {
 * 
 * Response response = client.newCall(request).execute(); ResponseBody
 * responseBody = response.body();
 * 
 * // general OCR로 받아온 결과값 출력 String result = responseBody.string();
 * System.out.println("api로 받아온 general OCR : " + result);
 * 
 * } catch (Exception e) { e.printStackTrace(); }
 * 
 * return "ocr/generalOcr";
 * 
 * }
 * 
 * // general OCR 요청 이거로 해야함 // 실제 api 호출 test ('합'으로 시작하는 inferText의 index or
 * '계'를 포함하는 index or '금액'을 포함하는 index) // java에서 api요청하는 방법 restTemplate도 존재함
 * // 합계, 소계, 결제금액, 판매금액 => List의 최대값 추출
 * 
 * @RequestMapping("/ocr/test2")
 * 
 * @org.springframework.web.bind.annotation.ResponseBody public List<String>
 * testOcr2() {
 * 
 * // api로 요청한 값, 추출된 text List<String> inferTextList = new ArrayList<String>();
 * 
 * // '합'으로 시작하는 인덱스 리스트 List<Integer> correctIndexList = new
 * ArrayList<Integer>();
 * 
 * // 쉼표를 공백으로 대체한 실제 합계금액이 저장되는 리스트 List<Integer> resultList = new
 * ArrayList<Integer>(); StringBuilder sb = new StringBuilder(); // 결과 문자값 저장
 * 
 * OkHttpClient client = new OkHttpClient();
 * 
 * MediaType mediaType = MediaType.parse("application/json");
 * 
 * RequestBody body = RequestBody.create(mediaType, "{\n\t\"version\" : \"V1\","
 * + "\n\t\"requestId\" : \"test2\"," + "\n\t\"timestamp\" : 0," +
 * "\n\t\"images\" :[{\n\t\t\n\t\t\"format\" : \"jpg\"," +
 * "\n\t\t\"url\" : \"https://kr.object.ncloudstorage.com/testbucke/test8.jpg\","
 * + "\n\t\t\"name\" : \"test8.jpg\"\n\t}]\n}");
 * 
 * // 알아서 객체 생성? (request 객체 생성) Request request = new Request.Builder().url(
 * "https://55c7547061ee4d91891f615ee5e7c101.apigw.ntruss.com/custom/v1/10737/a4ea6ab1e2b24fda85a939e66443d9c380440ecaf6e6e6069e248761c5a0353b/general")
 * .post(body).addHeader("content-type", "application/json")
 * .addHeader("x-ocr-secret", "cHBIclVDQnZaV3NkQVJBUnRhaGdsaGxMTEllSEtzSkM=")
 * .addHeader("cache-control", "no-cache") // .addHeader("postman-token",
 * "31917011-c262-8273-4761-7a87eef0d3fa") .build();
 * 
 * try {
 * 
 * Response response = client.newCall(request).execute(); ResponseBody
 * responseBody = response.body();
 * 
 * // general OCR로 받아온 결과값 출력 String result = responseBody.string();
 * System.out.println("api로 받아온 general OCR : " + result); // 세진이는 본인이 만든 api에서
 * 값을 받아와서 바로 map으로 넣음
 * 
 * ObjectMapper mapper = new ObjectMapper();
 * 
 * JsonNode root = mapper.readTree(result);
 * 
 * JsonNode images = root.path("images");
 * 
 * inferTextList = images.get(0).path("fields").findValuesAsText("inferText");
 * System.out.println("List 크기 : " + inferTextList.size());
 * 
 * for (int i = 0; i < inferTextList.size(); i++) {
 * 
 * // 합 계, 소 계, 판매금액, 결제금액 if ( inferTextList.get(i).startsWith("합") ||
 * inferTextList.get(i).contains("계") || inferTextList.get(i).contains("금액")) {
 * 
 * // inferTextList의 index 저장, 중복 제거할 필요없음 correctIndexList.add(i); }
 * 
 * }
 * 
 * System.out.println("correctIndexList : " + correctIndexList); // [41, 48, 49]
 * // System.out.println(inferTextList.get(41)); //
 * System.out.println(inferTextList.get(48)); //
 * System.out.println(inferTextList.get(49));
 * 
 * for (int i = 0; i < correctIndexList.size(); i++) {
 * 
 * 
 * int cnt = correctIndexList.get(i);
 * 
 * sb.append(inferTextList.get(cnt));
 * 
 * 
 * while (cnt < inferTextList.size() - 1) {
 * 
 * 
 * cnt = cnt + 1;
 * 
 * if (checkInt(inferTextList.get(cnt).replaceAll("[^0-9]", ""))) {
 * 
 * resultList.add(Integer.parseInt(inferTextList.get(cnt).replaceAll("[^0-9]",""
 * )));
 * 
 * break;
 * 
 * 
 * 
 * } else {
 * 
 * // int형 변경 실패 sb.append(inferTextList.get(cnt));
 * System.out.println(sb.toString()); }
 * 
 * }
 * 
 * }
 * 
 * } catch (Exception e) { e.printStackTrace(); }
 * System.out.println("resultList : " + resultList);
 * System.out.println("resultList중 최대값 : " + Collections.max(resultList));
 * 
 * // @ResponseBody List 출력 return inferTextList;
 * 
 * }
 * 
 * @GetMapping("/ocr/enter") public String getOcrPage() {
 * 
 * return "ocr/getOCR"; }
 * 
 * @RequestMapping("/ocr/test")
 * 
 * @org.springframework.web.bind.annotation.ResponseBody public List<String>
 * testOcr() {
 * 
 * // api로 요청한 값, 추출된 text List<String> inferTextList = new ArrayList<String>();
 * 
 * // '합'으로 시작하는 인덱스 리스트 List<Integer> correctIndexList = new
 * ArrayList<Integer>();
 * 
 * // 쉼표를 공백으로 대체한 실제 합계금액이 저장되는 리스트 List<Integer> resultList = new
 * ArrayList<Integer>(); StringBuilder sb = new StringBuilder(); // 결과 문자값 저장
 * 
 * String result = "{\r\n" + "    \"version\": \"V1\",\r\n" +
 * "    \"requestId\": \"test2\",\r\n" + "    \"timestamp\": 1629883667728,\r\n"
 * + "    \"images\": [\r\n" + "        {\r\n" +
 * "            \"uid\": \"bad4d11b4f3a46b7bdc5d501109a1167\",\r\n" +
 * "            \"name\": \"test4\",\r\n" +
 * "            \"inferResult\": \"SUCCESS\",\r\n" +
 * "            \"message\": \"SUCCESS\",\r\n" +
 * "            \"validationResult\": {\r\n" +
 * "                \"result\": \"NO_REQUESTED\"\r\n" + "            },\r\n" +
 * "            \"fields\": [\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 665,\r\n" +
 * "                                \"y\": 257\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2325,\r\n" +
 * "                                \"y\": 188\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2335,\r\n" +
 * "                                \"y\": 429\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 675,\r\n" +
 * "                                \"y\": 499\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"STARBUCKS\",\r\n" +
 * "                    \"inferConfidence\": 0.9997\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 781,\r\n" +
 * "                                \"y\": 550\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2200,\r\n" +
 * "                                \"y\": 534\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2202,\r\n" +
 * "                                \"y\": 683\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 783,\r\n" +
 * "                                \"y\": 699\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"현금 (소득공제)\",\r\n" +
 * "                    \"inferConfidence\": 0.9288\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 455,\r\n" +
 * "                                \"y\": 705\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 856,\r\n" +
 * "                                \"y\": 679\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 863,\r\n" +
 * "                                \"y\": 786\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 462,\r\n" +
 * "                                \"y\": 812\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"인하대점\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1942,\r\n" +
 * "                                \"y\": 674\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2536,\r\n" +
 * "                                \"y\": 652\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2541,\r\n" +
 * "                                \"y\": 771\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1946,\r\n" +
 * "                                \"y\": 792\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"T:1522-3232\",\r\n" +
 * "                    \"inferConfidence\": 0.9937\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 449,\r\n" +
 * "                                \"y\": 803\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 661,\r\n" +
 * "                                \"y\": 783\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 671,\r\n" +
 * "                                \"y\": 888\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 458,\r\n" +
 * "                                \"y\": 907\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"인천\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 709,\r\n" +
 * "                                \"y\": 771\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1124,\r\n" +
 * "                                \"y\": 762\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1126,\r\n" +
 * "                                \"y\": 881\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 712,\r\n" +
 * "                                \"y\": 891\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"미추홀구\",\r\n" +
 * "                    \"inferConfidence\": 0.9979\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1171,\r\n" +
 * "                                \"y\": 754\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1499,\r\n" +
 * "                                \"y\": 754\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1499,\r\n" +
 * "                                \"y\": 882\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1171,\r\n" +
 * "                                \"y\": 882\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"인하로\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1527,\r\n" +
 * "                                \"y\": 759\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1665,\r\n" +
 * "                                \"y\": 759\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1665,\r\n" +
 * "                                \"y\": 882\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1527,\r\n" +
 * "                                \"y\": 882\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"59\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 446,\r\n" +
 * "                                \"y\": 893\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 701,\r\n" +
 * "                                \"y\": 880\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 707,\r\n" +
 * "                                \"y\": 986\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 452,\r\n" +
 * "                                \"y\": 1000\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"대표:\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 707,\r\n" +
 * "                                \"y\": 868\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1437,\r\n" +
 * "                                \"y\": 868\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1437,\r\n" +
 * "                                \"y\": 991\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 707,\r\n" +
 * "                                \"y\": 991\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"송데이비드호섭\",\r\n" +
 * "                    \"inferConfidence\": 0.9994\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1890,\r\n" +
 * "                                \"y\": 878\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2546,\r\n" +
 * "                                \"y\": 861\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2549,\r\n" +
 * "                                \"y\": 986\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1893,\r\n" +
 * "                                \"y\": 1003\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"201-81-21515\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 445,\r\n" +
 * "                                \"y\": 980\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1015,\r\n" +
 * "                                \"y\": 973\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1016,\r\n" +
 * "                                \"y\": 1095\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 446,\r\n" +
 * "                                \"y\": 1102\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"[매장#9622,\",\r\n" +
 * "                    \"inferConfidence\": 0.9996\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1058,\r\n" +
 * "                                \"y\": 968\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1247,\r\n" +
 * "                                \"y\": 968\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1247,\r\n" +
 * "                                \"y\": 1091\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1058,\r\n" +
 * "                                \"y\": 1091\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"POS\",\r\n" +
 * "                    \"inferConfidence\": 0.9996\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1271,\r\n" +
 * "                                \"y\": 972\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1442,\r\n" +
 * "                                \"y\": 972\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1442,\r\n" +
 * "                                \"y\": 1091\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1271,\r\n" +
 * "                                \"y\": 1091\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"01]\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1532,\r\n" +
 * "                                \"y\": 974\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2074,\r\n" +
 * "                                \"y\": 982\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2072,\r\n" +
 * "                                \"y\": 1094\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1530,\r\n" +
 * "                                \"y\": 1086\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"2021-08-16\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2106,\r\n" +
 * "                                \"y\": 982\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2267,\r\n" +
 * "                                \"y\": 982\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2267,\r\n" +
 * "                                \"y\": 1091\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2106,\r\n" +
 * "                                \"y\": 1091\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"13:\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2258,\r\n" +
 * "                                \"y\": 982\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2424,\r\n" +
 * "                                \"y\": 982\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2424,\r\n" +
 * "                                \"y\": 1091\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2258,\r\n" +
 * "                                \"y\": 1091\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"27:\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2414,\r\n" +
 * "                                \"y\": 968\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2542,\r\n" +
 * "                                \"y\": 968\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2542,\r\n" +
 * "                                \"y\": 1086\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2414,\r\n" +
 * "                                \"y\": 1086\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"36\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 759,\r\n" +
 * "                                \"y\": 1181\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1627,\r\n" +
 * "                                \"y\": 1181\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1627,\r\n" +
 * "                                \"y\": 1432\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 759,\r\n" +
 * "                                \"y\": 1432\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"주문번호\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1665,\r\n" +
 * "                                \"y\": 1186\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2149,\r\n" +
 * "                                \"y\": 1186\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2149,\r\n" +
 * "                                \"y\": 1418\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1665,\r\n" +
 * "                                \"y\": 1418\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"A-50\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 446,\r\n" +
 * "                                \"y\": 1491\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1196,\r\n" +
 * "                                \"y\": 1499\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1195,\r\n" +
 * "                                \"y\": 1622\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 445,\r\n" +
 * "                                \"y\": 1613\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"I-T)아메리카노\",\r\n" +
 * "                    \"inferConfidence\": 0.9991\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1535,\r\n" +
 * "                                \"y\": 1498\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1825,\r\n" +
 * "                                \"y\": 1491\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1828,\r\n" +
 * "                                \"y\": 1603\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1537,\r\n" +
 * "                                \"y\": 1609\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"4,100\",\r\n" +
 * "                    \"inferConfidence\": 0.9992\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1959,\r\n" +
 * "                                \"y\": 1503\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2011,\r\n" +
 * "                                \"y\": 1503\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2011,\r\n" +
 * "                                \"y\": 1598\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1959,\r\n" +
 * "                                \"y\": 1598\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"1\",\r\n" +
 * "                    \"inferConfidence\": 0.9997\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2248,\r\n" +
 * "                                \"y\": 1495\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2541,\r\n" +
 * "                                \"y\": 1476\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2548,\r\n" +
 * "                                \"y\": 1589\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2255,\r\n" +
 * "                                \"y\": 1609\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"4,100\",\r\n" +
 * "                    \"inferConfidence\": 0.999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 455,\r\n" +
 * "                                \"y\": 1698\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 673,\r\n" +
 * "                                \"y\": 1698\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 673,\r\n" +
 * "                                \"y\": 1821\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 455,\r\n" +
 * "                                \"y\": 1821\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"합계\",\r\n" +
 * "                    \"inferConfidence\": 0.9984\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1760,\r\n" +
 * "                                \"y\": 1726\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1821,\r\n" +
 * "                                \"y\": 1726\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1821,\r\n" +
 * "                                \"y\": 1788\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1760,\r\n" +
 * "                                \"y\": 1788\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \">\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2249,\r\n" +
 * "                                \"y\": 1703\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2541,\r\n" +
 * "                                \"y\": 1690\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2546,\r\n" +
 * "                                \"y\": 1801\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2254,\r\n" +
 * "                                \"y\": 1813\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"4,100\",\r\n" +
 * "                    \"inferConfidence\": 0.9985\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 470,\r\n" +
 * "                                \"y\": 1902\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1285,\r\n" +
 * "                                \"y\": 1902\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1285,\r\n" +
 * "                                \"y\": 2030\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 470,\r\n" +
 * "                                \"y\": 2030\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"결제금액\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1995,\r\n" +
 * "                                \"y\": 1912\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2542,\r\n" +
 * "                                \"y\": 1900\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2544,\r\n" +
 * "                                \"y\": 2017\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1997,\r\n" +
 * "                                \"y\": 2029\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"4,100\",\r\n" +
 * "                    \"inferConfidence\": 0.9953\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 455,\r\n" +
 * "                                \"y\": 2011\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1105,\r\n" +
 * "                                \"y\": 2011\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1105,\r\n" +
 * "                                \"y\": 2130\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 455,\r\n" +
 * "                                \"y\": 2130\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"(부가세포함)\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2260,\r\n" +
 * "                                \"y\": 2007\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2542,\r\n" +
 * "                                \"y\": 2000\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2544,\r\n" +
 * "                                \"y\": 2115\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2263,\r\n" +
 * "                                \"y\": 2121\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"(373)\",\r\n" +
 * "                    \"inferConfidence\": 0.9996\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 446,\r\n" +
 * "                                \"y\": 2210\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 574,\r\n" +
 * "                                \"y\": 2210\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 574,\r\n" +
 * "                                \"y\": 2338\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 446,\r\n" +
 * "                                \"y\": 2338\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"제\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 664,\r\n" +
 * "                                \"y\": 2210\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 797,\r\n" +
 * "                                \"y\": 2210\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 797,\r\n" +
 * "                                \"y\": 2338\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 664,\r\n" +
 * "                                \"y\": 2338\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"휴\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 877,\r\n" +
 * "                                \"y\": 2210\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1010,\r\n" +
 * "                                \"y\": 2210\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1010,\r\n" +
 * "                                \"y\": 2338\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 877,\r\n" +
 * "                                \"y\": 2338\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"사\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2251,\r\n" +
 * "                                \"y\": 2208\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2546,\r\n" +
 * "                                \"y\": 2202\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2549,\r\n" +
 * "                                \"y\": 2319\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2253,\r\n" +
 * "                                \"y\": 2325\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"4,100\",\r\n" +
 * "                    \"inferConfidence\": 0.9983\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 455,\r\n" +
 * "                                \"y\": 2419\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 683,\r\n" +
 * "                                \"y\": 2419\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 683,\r\n" +
 * "                                \"y\": 2533\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 455,\r\n" +
 * "                                \"y\": 2533\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"카드\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 787,\r\n" +
 * "                                \"y\": 2419\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1100,\r\n" +
 * "                                \"y\": 2419\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1100,\r\n" +
 * "                                \"y\": 2528\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 787,\r\n" +
 * "                                \"y\": 2528\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"종류:\",\r\n" +
 * "                    \"inferConfidence\": 0.8972\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2044,\r\n" +
 * "                                \"y\": 2405\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2547,\r\n" +
 * "                                \"y\": 2405\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2547,\r\n" +
 * "                                \"y\": 2514\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2044,\r\n" +
 * "                                \"y\": 2514\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"KAKAOTALK\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 451,\r\n" +
 * "                                \"y\": 2518\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 673,\r\n" +
 * "                                \"y\": 2518\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 673,\r\n" +
 * "                                \"y\": 2642\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 451,\r\n" +
 * "                                \"y\": 2642\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"회원\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 792,\r\n" +
 * "                                \"y\": 2523\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1100,\r\n" +
 * "                                \"y\": 2523\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1100,\r\n" +
 * "                                \"y\": 2632\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 792,\r\n" +
 * "                                \"y\": 2632\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"번호 :\",\r\n" +
 * "                    \"inferConfidence\": 0.9195\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1902,\r\n" +
 * "                                \"y\": 2509\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2547,\r\n" +
 * "                                \"y\": 2509\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2547,\r\n" +
 * "                                \"y\": 2618\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1902,\r\n" +
 * "                                \"y\": 2618\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"9589****9173\",\r\n" +
 * "                    \"inferConfidence\": 0.9994\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 455,\r\n" +
 * "                                \"y\": 2628\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 673,\r\n" +
 * "                                \"y\": 2628\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 673,\r\n" +
 * "                                \"y\": 2746\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 455,\r\n" +
 * "                                \"y\": 2746\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"승인\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 792,\r\n" +
 * "                                \"y\": 2628\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1105,\r\n" +
 * "                                \"y\": 2628\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1105,\r\n" +
 * "                                \"y\": 2737\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 792,\r\n" +
 * "                                \"y\": 2737\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"번호:\",\r\n" +
 * "                    \"inferConfidence\": 0.8433\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1650,\r\n" +
 * "                                \"y\": 2609\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2552,\r\n" +
 * "                                \"y\": 2603\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2552,\r\n" +
 * "                                \"y\": 2721\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1651,\r\n" +
 * "                                \"y\": 2728\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"20210816132735678\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 465,\r\n" +
 * "                                \"y\": 2836\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1005,\r\n" +
 * "                                \"y\": 2836\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1005,\r\n" +
 * "                                \"y\": 2955\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 465,\r\n" +
 * "                                \"y\": 2955\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"현금영수증\",\r\n" +
 * "                    \"inferConfidence\": 0.9977\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1062,\r\n" +
 * "                                \"y\": 2831\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1366,\r\n" +
 * "                                \"y\": 2831\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1366,\r\n" +
 * "                                \"y\": 2941\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1062,\r\n" +
 * "                                \"y\": 2941\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"발급:\",\r\n" +
 * "                    \"inferConfidence\": 0.9219\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1854,\r\n" +
 * "                                \"y\": 2813\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2547,\r\n" +
 * "                                \"y\": 2813\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2547,\r\n" +
 * "                                \"y\": 2917\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1854,\r\n" +
 * "                                \"y\": 2917\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"010-****-0410\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 463,\r\n" +
 * "                                \"y\": 2946\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 953,\r\n" +
 * "                                \"y\": 2935\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 955,\r\n" +
 * "                                \"y\": 3055\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 465,\r\n" +
 * "                                \"y\": 3066\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"승인금액:\",\r\n" +
 * "                    \"inferConfidence\": 0.9995\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1193,\r\n" +
 * "                                \"y\": 2927\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1479,\r\n" +
 * "                                \"y\": 2920\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1482,\r\n" +
 * "                                \"y\": 3025\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1196,\r\n" +
 * "                                \"y\": 3032\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"4,100\",\r\n" +
 * "                    \"inferConfidence\": 0.9983\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1617,\r\n" +
 * "                                \"y\": 2912\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2073,\r\n" +
 * "                                \"y\": 2912\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2073,\r\n" +
 * "                                \"y\": 3031\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1617,\r\n" +
 * "                                \"y\": 3031\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"승인번호:\",\r\n" +
 * "                    \"inferConfidence\": 0.9997\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2058,\r\n" +
 * "                                \"y\": 2912\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2552,\r\n" +
 * "                                \"y\": 2912\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2552,\r\n" +
 * "                                \"y\": 3026\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2058,\r\n" +
 * "                                \"y\": 3026\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"176987380\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 835,\r\n" +
 * "                                \"y\": 3036\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1369,\r\n" +
 * "                                \"y\": 3012\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1375,\r\n" +
 * "                                \"y\": 3138\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 841,\r\n" +
 * "                                \"y\": 3163\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"현금영수증\",\r\n" +
 * "                    \"inferConfidence\": 0.9994\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1413,\r\n" +
 * "                                \"y\": 3016\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1622,\r\n" +
 * "                                \"y\": 3016\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1622,\r\n" +
 * "                                \"y\": 3135\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1413,\r\n" +
 * "                                \"y\": 3135\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"문의\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1674,\r\n" +
 * "                                \"y\": 3035\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1712,\r\n" +
 * "                                \"y\": 3035\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1712,\r\n" +
 * "                                \"y\": 3102\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1674,\r\n" +
 * "                                \"y\": 3102\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \":\",\r\n" +
 * "                    \"inferConfidence\": 0.9993\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1755,\r\n" +
 * "                                \"y\": 3012\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2125,\r\n" +
 * "                                \"y\": 3012\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2125,\r\n" +
 * "                                \"y\": 3121\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1755,\r\n" +
 * "                                \"y\": 3121\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"126-1-1\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 622,\r\n" +
 * "                                \"y\": 3245\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1061,\r\n" +
 * "                                \"y\": 3226\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1067,\r\n" +
 * "                                \"y\": 3352\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 627,\r\n" +
 * "                                \"y\": 3371\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"결제수단\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1108,\r\n" +
 * "                                \"y\": 3228\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1422,\r\n" +
 * "                                \"y\": 3221\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1425,\r\n" +
 * "                                \"y\": 3338\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1111,\r\n" +
 * "                                \"y\": 3346\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"변경은\",\r\n" +
 * "                    \"inferConfidence\": 0.9996\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1470,\r\n" +
 * "                                \"y\": 3211\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1869,\r\n" +
 * "                                \"y\": 3211\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1869,\r\n" +
 * "                                \"y\": 3329\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1470,\r\n" +
 * "                                \"y\": 3329\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"구입하신\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1921,\r\n" +
 * "                                \"y\": 3216\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2329,\r\n" +
 * "                                \"y\": 3216\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2329,\r\n" +
 * "                                \"y\": 3334\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1921,\r\n" +
 * "                                \"y\": 3334\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"매장에서\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 684,\r\n" +
 * "                                \"y\": 3349\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1150,\r\n" +
 * "                                \"y\": 3329\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1155,\r\n" +
 * "                                \"y\": 3445\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 689,\r\n" +
 * "                                \"y\": 3466\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"가능하며,\",\r\n" +
 * "                    \"inferConfidence\": 0.9997\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1217,\r\n" +
 * "                                \"y\": 3325\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1517,\r\n" +
 * "                                \"y\": 3318\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1520,\r\n" +
 * "                                \"y\": 3433\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1219,\r\n" +
 * "                                \"y\": 3441\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"반드시\",\r\n" +
 * "                    \"inferConfidence\": 0.9997\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1565,\r\n" +
 * "                                \"y\": 3315\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1769,\r\n" +
 * "                                \"y\": 3315\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1769,\r\n" +
 * "                                \"y\": 3424\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1565,\r\n" +
 * "                                \"y\": 3424\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"구매\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1822,\r\n" +
 * "                                \"y\": 3314\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2235,\r\n" +
 * "                                \"y\": 3320\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2233,\r\n" +
 * "                                \"y\": 3435\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1820,\r\n" +
 * "                                \"y\": 3429\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"영수증과\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 522,\r\n" +
 * "                                \"y\": 3459\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 847,\r\n" +
 * "                                \"y\": 3442\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 853,\r\n" +
 * "                                \"y\": 3564\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 528,\r\n" +
 * "                                \"y\": 3580\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"원거래\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 897,\r\n" +
 * "                                \"y\": 3439\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1417,\r\n" +
 * "                                \"y\": 3416\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1422,\r\n" +
 * "                                \"y\": 3532\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 902,\r\n" +
 * "                                \"y\": 3556\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"결제수단을\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1466,\r\n" +
 * "                                \"y\": 3415\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1983,\r\n" +
 * "                                \"y\": 3415\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1983,\r\n" +
 * "                                \"y\": 3533\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1466,\r\n" +
 * "                                \"y\": 3533\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"지참하셔야\",\r\n" +
 * "                    \"inferConfidence\": 0.9996\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2030,\r\n" +
 * "                                \"y\": 3415\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2376,\r\n" +
 * "                                \"y\": 3415\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2376,\r\n" +
 * "                                \"y\": 3533\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2030,\r\n" +
 * "                                \"y\": 3533\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"합니다.\",\r\n" +
 * "                    \"inferConfidence\": 0.9997\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 731,\r\n" +
 * "                                \"y\": 3547\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1000,\r\n" +
 * "                                \"y\": 3535\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1005,\r\n" +
 * "                                \"y\": 3651\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 737,\r\n" +
 * "                                \"y\": 3664\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"(변경\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1058,\r\n" +
 * "                                \"y\": 3529\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1271,\r\n" +
 * "                                \"y\": 3529\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1271,\r\n" +
 * "                                \"y\": 3643\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1058,\r\n" +
 * "                                \"y\": 3643\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"가능\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1309,\r\n" +
 * "                                \"y\": 3514\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1527,\r\n" +
 * "                                \"y\": 3514\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1527,\r\n" +
 * "                                \"y\": 3633\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1309,\r\n" +
 * "                                \"y\": 3633\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"기간\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1575,\r\n" +
 * "                                \"y\": 3533\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1613,\r\n" +
 * "                                \"y\": 3533\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1613,\r\n" +
 * "                                \"y\": 3600\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1575,\r\n" +
 * "                                \"y\": 3600\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \":\",\r\n" +
 * "                    \"inferConfidence\": 0.9975\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1655,\r\n" +
 * "                                \"y\": 3514\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2286,\r\n" +
 * "                                \"y\": 3514\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2286,\r\n" +
 * "                                \"y\": 3624\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1655,\r\n" +
 * "                                \"y\": 3624\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"~2021-08-30)\",\r\n" +
 * "                    \"inferConfidence\": 0.997\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 995,\r\n" +
 * "                                \"y\": 3743\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1982,\r\n" +
 * "                                \"y\": 3730\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1984,\r\n" +
 * "                                \"y\": 3832\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 996,\r\n" +
 * "                                \"y\": 3845\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"www.starbucks.co.kr\",\r\n" +
 * "                    \"inferConfidence\": 0.9693\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 992,\r\n" +
 * "                                \"y\": 4027\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1997,\r\n" +
 * "                                \"y\": 4033\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1997,\r\n" +
 * "                                \"y\": 4155\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 991,\r\n" +
 * "                                \"y\": 4150\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"*20180781106190622*\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 474,\r\n" +
 * "                                \"y\": 4183\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 598,\r\n" +
 * "                                \"y\": 4183\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 598,\r\n" +
 * "                                \"y\": 4302\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 474,\r\n" +
 * "                                \"y\": 4302\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"본\",\r\n" +
 * "                    \"inferConfidence\": 0.9996\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 635,\r\n" +
 * "                                \"y\": 4161\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1061,\r\n" +
 * "                                \"y\": 4138\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1068,\r\n" +
 * "                                \"y\": 4268\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 642,\r\n" +
 * "                                \"y\": 4292\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"영수증은\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1091,\r\n" +
 * "                                \"y\": 4136\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1281,\r\n" +
 * "                                \"y\": 4136\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1281,\r\n" +
 * "                                \"y\": 4259\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1091,\r\n" +
 * "                                \"y\": 4259\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"BPA\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1300,\r\n" +
 * "                                \"y\": 4141\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1532,\r\n" +
 * "                                \"y\": 4141\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1532,\r\n" +
 * "                                \"y\": 4250\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1300,\r\n" +
 * "                                \"y\": 4250\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"Free\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1566,\r\n" +
 * "                                \"y\": 4131\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1890,\r\n" +
 * "                                \"y\": 4139\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1887,\r\n" +
 * "                                \"y\": 4271\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1563,\r\n" +
 * "                                \"y\": 4263\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"종이를\",\r\n" +
 * "                    \"inferConfidence\": 0.9886\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1926,\r\n" +
 * "                                \"y\": 4141\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2490,\r\n" +
 * "                                \"y\": 4141\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2490,\r\n" +
 * "                                \"y\": 4273\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1926,\r\n" +
 * "                                \"y\": 4273\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"사용합니다.\",\r\n" +
 * "                    \"inferConfidence\": 0.9995\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 480,\r\n" +
 * "                                \"y\": 4372\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1213,\r\n" +
 * "                                \"y\": 4343\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1218,\r\n" +
 * "                                \"y\": 4476\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 485,\r\n" +
 * "                                \"y\": 4504\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"고객요청에의해\",\r\n" +
 * "                    \"inferConfidence\": 0.9976\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1262,\r\n" +
 * "                                \"y\": 4349\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1779,\r\n" +
 * "                                \"y\": 4349\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1779,\r\n" +
 * "                                \"y\": 4477\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1262,\r\n" +
 * "                                \"y\": 4477\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"일회용컵이\",\r\n" +
 * "                    \"inferConfidence\": 0.9976\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1822,\r\n" +
 * "                                \"y\": 4348\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2568,\r\n" +
 * "                                \"y\": 4364\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2565,\r\n" +
 * "                                \"y\": 4498\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1819,\r\n" +
 * "                                \"y\": 4482\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"제공되었습니다\",\r\n" +
 * "                    \"inferConfidence\": 0.9992\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 844,\r\n" +
 * "                                \"y\": 4548\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1124,\r\n" +
 * "                                \"y\": 4548\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1124,\r\n" +
 * "                                \"y\": 4653\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 844,\r\n" +
 * "                                \"y\": 4653\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"Wi-fi\",\r\n" +
 * "                    \"inferConfidence\": 0.9765\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1148,\r\n" +
 * "                                \"y\": 4553\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1390,\r\n" +
 * "                                \"y\": 4553\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1390,\r\n" +
 * "                                \"y\": 4657\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1148,\r\n" +
 * "                                \"y\": 4657\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"SSID\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1418,\r\n" +
 * "                                \"y\": 4572\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1470,\r\n" +
 * "                                \"y\": 4572\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1470,\r\n" +
 * "                                \"y\": 4643\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1418,\r\n" +
 * "                                \"y\": 4643\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \":\",\r\n" +
 * "                    \"inferConfidence\": 0.9995\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1503,\r\n" +
 * "                                \"y\": 4558\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1641,\r\n" +
 * "                                \"y\": 4558\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1641,\r\n" +
 * "                                \"y\": 4662\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1503,\r\n" +
 * "                                \"y\": 4662\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"KT\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1660,\r\n" +
 * "                                \"y\": 4566\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2159,\r\n" +
 * "                                \"y\": 4573\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2158,\r\n" +
 * "                                \"y\": 4677\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1659,\r\n" +
 * "                                \"y\": 4670\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"starbucks\",\r\n" +
 * "                    \"inferConfidence\": 0.9989\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1072,\r\n" +
 * "                                \"y\": 4662\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1480,\r\n" +
 * "                                \"y\": 4662\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1480,\r\n" +
 * "                                \"y\": 4776\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1072,\r\n" +
 * "                                \"y\": 4776\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"비밀번호\",\r\n" +
 * "                    \"inferConfidence\": 0.9996\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1613,\r\n" +
 * "                                \"y\": 4662\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1688,\r\n" +
 * "                                \"y\": 4662\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1688,\r\n" +
 * "                                \"y\": 4767\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1613,\r\n" +
 * "                                \"y\": 4767\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \":\",\r\n" +
 * "                    \"inferConfidence\": 0.9936\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1726,\r\n" +
 * "                                \"y\": 4681\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1940,\r\n" +
 * "                                \"y\": 4681\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1940,\r\n" +
 * "                                \"y\": 4805\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1726,\r\n" +
 * "                                \"y\": 4805\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"없음\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 489,\r\n" +
 * "                                \"y\": 4885\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 711,\r\n" +
 * "                                \"y\": 4885\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 711,\r\n" +
 * "                                \"y\": 4994\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 489,\r\n" +
 * "                                \"y\": 4994\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"KT외\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 492,\r\n" +
 * "                                \"y\": 4793\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 809,\r\n" +
 * "                                \"y\": 4769\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 818,\r\n" +
 * "                                \"y\": 4889\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 501,\r\n" +
 * "                                \"y\": 4913\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"가입된\",\r\n" +
 * "                    \"inferConfidence\": 0.9999\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 764,\r\n" +
 * "                                \"y\": 4867\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1076,\r\n" +
 * "                                \"y\": 4852\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1081,\r\n" +
 * "                                \"y\": 4964\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 769,\r\n" +
 * "                                \"y\": 4979\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"고객은\",\r\n" +
 * "                    \"inferConfidence\": 0.9997\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 864,\r\n" +
 * "                                \"y\": 4762\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1274,\r\n" +
 * "                                \"y\": 4744\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1279,\r\n" +
 * "                                \"y\": 4860\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 869,\r\n" +
 * "                                \"y\": 4879\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"통신사에\",\r\n" +
 * "                    \"inferConfidence\": 0.9996\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1125,\r\n" +
 * "                                \"y\": 4841\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1530,\r\n" +
 * "                                \"y\": 4854\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1526,\r\n" +
 * "                                \"y\": 4973\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1121,\r\n" +
 * "                                \"y\": 4960\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"약관동의\",\r\n" +
 * "                    \"inferConfidence\": 0.9994\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1331,\r\n" +
 * "                                \"y\": 4745\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1737,\r\n" +
 * "                                \"y\": 4774\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1728,\r\n" +
 * "                                \"y\": 4898\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1322,\r\n" +
 * "                                \"y\": 4869\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"관계없이\",\r\n" +
 * "                    \"inferConfidence\": 0.9997\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1579,\r\n" +
 * "                                \"y\": 4876\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1684,\r\n" +
 * "                                \"y\": 4876\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1684,\r\n" +
 * "                                \"y\": 4985\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1579,\r\n" +
 * "                                \"y\": 4985\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"및\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1733,\r\n" +
 * "                                \"y\": 4877\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1948,\r\n" +
 * "                                \"y\": 4886\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1943,\r\n" +
 * "                                \"y\": 4998\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1728,\r\n" +
 * "                                \"y\": 4989\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"인증\",\r\n" +
 * "                    \"inferConfidence\": 0.9987\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1784,\r\n" +
 * "                                \"y\": 4788\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2094,\r\n" +
 * "                                \"y\": 4796\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2091,\r\n" +
 * "                                \"y\": 4906\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1781,\r\n" +
 * "                                \"y\": 4899\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"전고객\",\r\n" +
 * "                    \"inferConfidence\": 0.9998\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 1997,\r\n" +
 * "                                \"y\": 4895\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2096,\r\n" +
 * "                                \"y\": 4895\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2096,\r\n" +
 * "                                \"y\": 4994\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 1997,\r\n" +
 * "                                \"y\": 4994\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"후\",\r\n" +
 * "                    \"inferConfidence\": 1\r\n" + "                },\r\n" +
 * "                {\r\n" + "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2144,\r\n" +
 * "                                \"y\": 4786\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2568,\r\n" +
 * "                                \"y\": 4795\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2565,\r\n" +
 * "                                \"y\": 4918\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2142,\r\n" +
 * "                                \"y\": 4909\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"사용가능\",\r\n" +
 * "                    \"inferConfidence\": 0.9992\r\n" +
 * "                },\r\n" + "                {\r\n" +
 * "                    \"valueType\": \"ALL\",\r\n" +
 * "                    \"boundingPoly\": {\r\n" +
 * "                        \"vertices\": [\r\n" +
 * "                            {\r\n" +
 * "                                \"x\": 2149,\r\n" +
 * "                                \"y\": 4899\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2566,\r\n" +
 * "                                \"y\": 4899\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2566,\r\n" +
 * "                                \"y\": 5013\r\n" +
 * "                            },\r\n" + "                            {\r\n" +
 * "                                \"x\": 2149,\r\n" +
 * "                                \"y\": 5013\r\n" +
 * "                            }\r\n" + "                        ]\r\n" +
 * "                    },\r\n" +
 * "                    \"inferText\": \"사용가능\",\r\n" +
 * "                    \"inferConfidence\": 0.9989\r\n" +
 * "                }\r\n" + "            ]\r\n" + "        }\r\n" + "    ]\r\n"
 * + "}";
 * 
 * System.out.println(result);
 * 
 * try { ObjectMapper mapper = new ObjectMapper();
 * 
 * // result = mapper.writeValueAsString(result);
 * 
 * JsonNode root = mapper.readTree(result); //
 * System.out.println("여기서부터 시작(readTree 한 것) : " + root);
 * 
 * JsonNode images = root.path("images"); // System.out.println("images : " +
 * images);
 * 
 * // System.out.println("fields : " + images.get(0).path("fields") );
 * 
 * // fields의 inferText를 모두 List로 저장
 * 
 * inferTextList = images.get(0).path("fields").findValuesAsText("inferText");
 * 
 * // System.out.println("List 출력 : " + inferTextList);
 * System.out.println("List 크기 : " + inferTextList.size());
 * 
 * // 리스트 하나씩 돌면서, '합'으로 시작하는 글자가 있는 인덱스를 추출 for (int i = 0; i <
 * inferTextList.size(); i++) {
 * 
 * if (inferTextList.get(i).startsWith("합")) {
 * 
 * correctIndexList.add(i); // [24, 66] 합계, 합니다. }
 * 
 * }
 * 
 * // correctIndexList에는 [24,66] for (int i = 0; i < correctIndexList.size();
 * i++) {
 * 
 * // 0번 인덱스에 24번 저장됨, 25번부터 int형으로 변환할 수 있는 숫자를 찾아야함 int cnt =
 * correctIndexList.get(i);
 * 
 * sb.append(inferTextList.get(cnt)); // sb에는 inferTextList.get(24) = "합계" 저장 //
 * 25번 인덱스부터 int형으로 변환할 수 있는 글자를 찾는다(쉼표를 공백으로 대체한), 여기서는 26번 인덱스에서 4,100 => 4100
 * // int형 변환 가능 => resultList
 * 
 * // inferTextList의 size까지만 동작해야함 cnt < inferTextList.size() -1 // 66 < 102 =>
 * 101까지만 돌아야함, 인덱스는 0~102, 66<103(size())까지돌면, 102 + 1 => 103되서 // 존재하지 않는
 * [103] 인덱스를 참조하게됨 // outofBounds 에러는 int값 체크하는 부분에서 발생함 =>
 * 
 * while (cnt < inferTextList.size() - 1) {
 * 
 * // inferTextList의 25번 인덱스부터 int형으로 변환 가능한 값 찾기 cnt = cnt + 1;
 * 
 * // inferTextList.get(cnt).replaceAll(",", ""); if
 * (checkInt(inferTextList.get(cnt).replaceAll(",", ""))) {
 * 
 * // int형 변경 성공하면, 이 부분 실행, String을 int로 변경해서 저장
 * resultList.add(Integer.parseInt(inferTextList.get(cnt).replaceAll(",", "")));
 * 
 * break;
 * 
 * } else {
 * 
 * // int형 변경 실패, sb.append(inferTextList.get(cnt)); }
 * 
 * // ~일 때 break }
 * 
 * }
 * 
 * // inferTextList.get(24); // inferTextList.get(66);
 * 
 * // inferTextList의 인덱스 24, 66 => temp에 저장
 * 
 * // 합이라는 글자로 시작하는 인덱스 추출 [24,66] // System.out.println(inferTextList.get(24));
 * // System.out.println(inferTextList.get(66)); //
 * System.out.println(correctIndexList);
 * 
 * } catch (Exception e) { e.printStackTrace(); }
 * 
 * System.out.println("resultList : " + resultList);
 * 
 * // @ResponseBody List 출력 return inferTextList;
 * 
 * }
 * 
 * public boolean checkInt(String str) {
 * 
 * // instanceof로 형변환 검사 하려했지만, String과 int는 부모자식 관계가 아니므로, 컴파일X //
 * NumberFormatException 예외 발생 시 false return try {
 * 
 * Integer.parseInt(str); return true;
 * 
 * } catch (NumberFormatException e) {
 * 
 * return false; }
 * 
 * }
 * 
 * }
 */
