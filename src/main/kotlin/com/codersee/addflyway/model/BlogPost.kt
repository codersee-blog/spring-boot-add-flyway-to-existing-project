package com.codersee.addflyway.model

import com.fasterxml.jackson.databind.JsonNode
import jakarta.persistence.*


@Entity
@Table(schema = "custom_schema", name = "blog_post")
data class BlogPost(
    @Id
    val id: Long? = null,
    val title: String,
    @Enumerated(EnumType.STRING) val category: BlogPostType,
    val content: JsonNode
)
