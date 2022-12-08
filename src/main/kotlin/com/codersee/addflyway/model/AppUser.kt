package com.codersee.addflyway.model

import jakarta.persistence.*

@Entity
@Table(schema = "custom_schema", name = "app_user")
data class AppUser(
    @Id
    val id: Long? = null,
    val username: String,
    val email: String,

    @Enumerated(EnumType.STRING)
    val userType: UserType,

    @OneToMany(
        cascade = [CascadeType.ALL],
        orphanRemoval = true,
        fetch = FetchType.EAGER
    )
    @JoinColumn(name = "author_id")
    val blogposts: List<BlogPost>,

    @OneToMany(
        cascade = [CascadeType.ALL],
        orphanRemoval = true,
        fetch = FetchType.EAGER
    )
    @JoinColumn(name = "author_id")
    val comments: List<BlogPostComment>
)
