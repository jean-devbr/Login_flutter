package com.uber.login_simples.controller;

import com.uber.login_simples.dto.CadastroDto;
import com.uber.login_simples.dto.LoginDto;
import com.uber.login_simples.model.Usuario;
import com.uber.login_simples.repository.UsuarioRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioRepository repository;

    // CADASTRO

    @PostMapping("/cadastro")
    public ResponseEntity<String> cadastrar(@Valid @RequestBody CadastroDto dto) {
        if (repository.findByEmail(dto.email()).isPresent()) {
            return ResponseEntity.badRequest().body("Email já cadrastado!");
        }

        Usuario usuario = new Usuario();
        usuario.setNome(dto.nome());
        usuario.setEmail(dto.email());
        usuario.setSenha(dto.senha());

        repository.save(usuario);
        return ResponseEntity.ok("Usuário cadastro com sucesso");
    }
}
