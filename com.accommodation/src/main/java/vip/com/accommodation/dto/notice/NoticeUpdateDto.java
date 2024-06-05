package vip.com.accommodation.dto.notice;


import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class NoticeUpdateDto {

    private int noticeId; //공지번호
    private String noticeSubject; //공지제목
    private String noticeContent; //공지내용
    private String noticeType; //공지유형 ex)중요,공지


}
