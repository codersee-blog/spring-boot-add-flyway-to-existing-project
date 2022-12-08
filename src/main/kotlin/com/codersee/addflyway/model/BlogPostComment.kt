package com.codersee.addflyway.model

import com.fasterxml.jackson.databind.JsonNode
import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.Table

@Entity
@Table(schema = "custom_schema", name = "blog_post_comment")
data class BlogPostComment(
    @Id
    val id: Long? = null,
    val content: JsonNode
)
