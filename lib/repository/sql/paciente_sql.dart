var SELECT_PACIENTE_INCLUDE_ENDERECO = '''
  SELECT 
    PA.ID_PACIENTE, PA.NOME_PACIENTE, PA.DAT_NASCIMENTO, PA.TELEFONE_PACIENTE, 
    PA.CPF_PACIENTE, PA.RG_PACIENTE, EN.ID_ENDERECO, EN.CIDADE, EN.LOGRADOURO,
    EN.CEP 
  FROM PACIENTE PA
  JOIN ENDERECO EN ON EN.ID_ENDERECO = PA.ID_ENDERECO 
''';

var SELECT_PACIENTE_BY_LOGIN = '''
  SELECT ID_PACIENTE, DAT_NASCIMENTO, NOME_PACIENTE, CPF_PACIENTE, RG_PACIENTE, TELEFONE_PACIENTE
  FROM PACIENTE
  WHERE ID_PACIENTE = (SELECT ID_USUARIO FROM USUARIO WHERE LOGIN = ?)
  LIMIT 1
''';

