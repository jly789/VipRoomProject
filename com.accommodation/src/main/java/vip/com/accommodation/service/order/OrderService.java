package vip.com.accommodation.service.order;

import vip.com.accommodation.dto.order.OrderInsertDto;

public interface OrderService {


    public int maxNum(); //가장높은 주문번호


    public void orderInsert(OrderInsertDto orderInsertDto); //주문등록

    public void orderDelete(int reservationId); //예약번호를 통한 주문삭제


}
