package vip.com.accommodation.mapper.order;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.order.OrderInsertDto;

@Mapper
public interface OrderMapper {

    public int maxNum(); //가장높은 주문번호


    public void orderInsert(OrderInsertDto orderInsertDto); //주문등록

    public void orderDelete(int reservationId); //예약번호를 통한 주문삭제







}
