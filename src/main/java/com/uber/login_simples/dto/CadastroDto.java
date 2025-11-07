package com.uber.login_simples.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public record CadastroDto(
        @NotBlank String nome,
        @NotBlank @Email String email,
        @NotBlank String senha
) {}
