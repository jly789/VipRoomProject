package vip.com.accommodation.dto.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberLoginDto {

    private String userId; //사용자아이디
    private String pwd; //비밀번호
}
