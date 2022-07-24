package com.poly.shop.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "accounts")
public class Account implements Serializable {
    @Id
    @Column(length = 30)
    private String username;
    @Column(columnDefinition = "varchar(20) not null")
    private String password;
    private Boolean role;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    @JsonIgnore
    private Set<Order> orders;
}
