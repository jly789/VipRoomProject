package vip.com.accommodation.dto.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberInsertDto {

    private int memberId;
    private String userId;
    private String pwd;
    private String userName;
}
