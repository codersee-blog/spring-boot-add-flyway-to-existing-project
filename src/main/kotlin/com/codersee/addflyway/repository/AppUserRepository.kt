package com.codersee.addflyway.repository

import com.codersee.addflyway.model.AppUser
import org.springframework.data.repository.CrudRepository

interface AppUserRepository : CrudRepository<AppUser, Long>