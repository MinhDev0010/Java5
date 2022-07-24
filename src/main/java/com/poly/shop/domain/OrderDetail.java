package com.poly.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orderDetail")
public class OrderDetail implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long oderDetailId;
    @Column(nullable = false)
    private Long oderId;
    @Column(nullable = false)
    private Integer quantity;
    @Column(nullable = false)
    private Double unitPrice;

    @ManyToOne(fetch = FetchType.EAGER)
    private Product product;
    
    @ManyToOne(fetch = FetchType.EAGER)
    private Order order;
}
