echo "Esse é o Gerador de Senhas Aleatórias!"
echo "Quantos caracteres a senha deve ter?"
read caracteres


senha=$(openssl rand -base64 48 | cut -c1-$caracteres)
echo "Sua senha gerada é: $senha"


function verificar_forca() {
  local senha="$1"
  local forca=0

  # Verifica se contém letras maiúsculas, minúsculas, números e símbolos
  [[ "$senha" =~ [A-Z] ]] && ((forca++))
  [[ "$senha" =~ [a-z] ]] && ((forca++))
  [[ "$senha" =~ [0-9] ]] && ((forca++))
 
  [[ "$senha" =~ [\!\@\#\$\%\^\&\*\(\)\_\+\=\-] ]] && ((forca++))

  case $forca in
    4) echo "Senha forte!" ;;
    3) echo "Senha moderada." ;;
    2) echo "Senha fraca." ;;
    *) echo "Senha muito fraca!" ;;
  esac
}

verificar_forca "$senha"


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
