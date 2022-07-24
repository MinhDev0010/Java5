package com.poly.shop.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "oders")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long oderId;
    @Temporal(TemporalType.DATE)
    private Date oderDate;
    @Column(nullable = false)
    private Double amount;
    @Column(nullable = false)
    private String status;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    @JsonIgnore
    private Set<OrderDetail> orderDetail;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Account account;

}
