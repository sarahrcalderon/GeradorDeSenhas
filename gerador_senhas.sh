echo "Esse é o Gerador de Senhas Aleatórias!"
echo "Quantos caracteres a senha deve ter?"
read caracteres

senha=$(openssl rand -base64 48 | cut -c1-$caracteres)
echo "Sua senha gerada é: $senha"

echo "Deseja salvar a senha em um arquivo? (s/n)"
read salvar

if [[ "$salvar" == "s" || "$salvar" == "S" ]]; then
  echo "Digite o nome do arquivo (exemplo: senha.txt):"
  read arquivo
  echo "Senha gerada: $senha" >> "$arquivo"
  echo "Senha salva em $arquivo!"
else
  echo "Senha não salva."
fi
