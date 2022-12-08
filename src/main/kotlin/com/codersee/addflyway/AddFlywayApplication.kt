package com.codersee.addflyway

import com.codersee.addflyway.repository.AppUserRepository
import org.slf4j.LoggerFactory
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.stereotype.Component

private val logger = LoggerFactory.getLogger(AddFlywayApplication::class.java)

@SpringBootApplication
class AddFlywayApplication

fun main(args: Array<String>) {
    runApplication<AddFlywayApplication>(*args)
}

@Component
class AnotherBean(
    private val appUserRepository: AppUserRepository
) : CommandLineRunner {

    override fun run(vararg args: String) {
        val users = appUserRepository.findAll()

        users.forEach {
            logger.info(it.toString())
        }
    }
}