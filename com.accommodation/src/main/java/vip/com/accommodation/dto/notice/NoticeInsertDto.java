package vip.com.accommodation.dto.notice;


import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class NoticeInsertDto {

    private int noticeId; //공지번호
    private int memberId; //회원번호
    private int noticeViews; //공지조회수
    private String noticeSubject; //공지제목
    private String noticeContent; //공지내용
    private String noticeType; //공지유형 ex)중요,공지
    private LocalDate noticeDate; //공지등록일



}
