package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="cliente")

public class Cliente {
	
	@Id
	@GeneratedValue
	@Column(name = "idcliente", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idCliente;
	
	@Column(name = "nome", type = Column.STRING, length = 150, nullable = false)
	private String nome;
	
	@Column(name = "rg", type = Column.STRING, length = 13, nullable = false)
	private String rg;
	
	@Column(name = "cpf", type = Column.STRING, length = 16, nullable = false)
	private String cpf;
		
	@Column(name = "telefone", type = Column.STRING, length = 15, nullable = false)
	private String telefone;
	
	@Column(name = "celular", type = Column.STRING, length = 15, nullable = false)
	private String celular;
	
	@Column(name = "email", type = Column.STRING, length = 100, nullable = false)
	private String email;
			
	@Column(name = "endereco", type = Column.STRING, length = 150, nullable = false)
	private String endereco;
	
	@Column(name = "numero", type = Column.STRING, length = 10, nullable = false)
	private String numero;
	
	@Column(name = "bairro", type = Column.STRING, length = 45, nullable = false)
	private String bairro;
	
	@Column(name = "cep", type = Column.STRING, length = 45, nullable = false)
	private String cep;
	
	@Column(name = "sexo", type = Column.STRING, length = 1, nullable = false)
	private String sexo;
	
	@Column(name = "pais", type = Column.OBJECT, nullable = false)
	private Pais pais;
	
	@Column(name = "estado", type = Column.OBJECT, nullable = false)
	private Estado estado;
	
	@Column(name = "cidade", type = Column.OBJECT, nullable = false)
	private Cidade cidade;
	
	@Column(name = "observacoes", type = Column.STRING, length = 400, nullable = false)
	private String observacoes;
	
	@Column(name = "datanascimento", type = Column.STRING, length = 14, nullable = false)
	private String dataNascimento;

	public Integer getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	public String getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(String dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cliente other = (Cliente) obj;
		if (bairro == null) {
			if (other.bairro != null)
				return false;
		} else if (!bairro.equals(other.bairro))
			return false;
		if (celular == null) {
			if (other.celular != null)
				return false;
		} else if (!celular.equals(other.celular))
			return false;
		if (cep == null) {
			if (other.cep != null)
				return false;
		} else if (!cep.equals(other.cep))
			return false;
		if (cidade == null) {
			if (other.cidade != null)
				return false;
		} else if (!cidade.equals(other.cidade))
			return false;
		if (cpf == null) {
			if (other.cpf != null)
				return false;
		} else if (!cpf.equals(other.cpf))
			return false;
		if (dataNascimento == null) {
			if (other.dataNascimento != null)
				return false;
		} else if (!dataNascimento.equals(other.dataNascimento))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (endereco == null) {
			if (other.endereco != null)
				return false;
		} else if (!endereco.equals(other.endereco))
			return false;
		if (estado == null) {
			if (other.estado != null)
				return false;
		} else if (!estado.equals(other.estado))
			return false;
		if (idCliente == null) {
			if (other.idCliente != null)
				return false;
		} else if (!idCliente.equals(other.idCliente))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (numero == null) {
			if (other.numero != null)
				return false;
		} else if (!numero.equals(other.numero))
			return false;
		if (observacoes == null) {
			if (other.observacoes != null)
				return false;
		} else if (!observacoes.equals(other.observacoes))
			return false;
		if (pais == null) {
			if (other.pais != null)
				return false;
		} else if (!pais.equals(other.pais))
			return false;
		if (rg == null) {
			if (other.rg != null)
				return false;
		} else if (!rg.equals(other.rg))
			return false;
		if (sexo == null) {
			if (other.sexo != null)
				return false;
		} else if (!sexo.equals(other.sexo))
			return false;
		if (telefone == null) {
			if (other.telefone != null)
				return false;
		} else if (!telefone.equals(other.telefone))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Cliente [idCliente=" + this.idCliente + ", nome=" + this.nome + ", rg="
				+ this.rg + ", cpf=" + this.cpf + ", telefone=" + this.telefone + ", celular="
				+ this.celular + ", email=" + this.email + ", endereco=" + this.endereco
				+ ", numero=" + this.numero + ", bairro=" + this.bairro + ", cep=" + this.cep
				+ ", sexo=" + this.sexo + ", pais=" + this.pais + ", estado=" + this.estado
				+ ", cidade=" + this.cidade + ", observacoes=" + this.observacoes
				+ ", dataNascimento=" + this.dataNascimento + "]";
	}
	
}
