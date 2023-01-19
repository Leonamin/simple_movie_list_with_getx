// 데이터 소스에서 데이터를 가져왔을 때 성공유무를 확인
// data: 실패면 올일이 없겠죠?
// isSuccess: 성공 하면 true -> data가 있어야한다. false -> 실패 했으니 data가 없네!
// messeage: json 같은 형식으로 메세지를 가져오면 되지 않을까.
class DataResult<T> {
  final T? data;
  final bool isSuccess;
  final String? messeage;

  DataResult({
    this.data,
    required this.isSuccess,
    this.messeage,
  });
}
