package vip.com.accommodation.mapper.member;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.member.MemberInsertDto;

@Mapper
public interface MemberMapper {

    public int maxNum();

    public void insertData(MemberInsertDto memberInsertDto);
}
