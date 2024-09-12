import 'dart:io'; // File 클래스 사용을 위해 필요
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // image_picker 패키지

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = []; // 메시지와 이미지 정보도 저장
  final TextEditingController _controller = TextEditingController(); // 입력 필드 컨트롤러
  final ImagePicker _picker = ImagePicker(); // 이미지 선택을 위한 ImagePicker

  void _sendMessage(String sender, {File? image}) {
    if (_controller.text.isEmpty && image == null) return; // 입력된 메시지와 이미지가 없으면 리턴
    setState(() {
      _messages.add({
        "text": _controller.text,
        "sender": sender,
        "image": image, // 이미지 추가
      }); // 입력된 메시지를 리스트에 추가
    });
    _controller.clear(); // 입력 필드를 비움
  }

  // 이미지 선택 함수
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery); // 갤러리에서 이미지 선택
    if (pickedFile != null) {
      _sendMessage('me', image: File(pickedFile.path)); // 선택한 이미지를 보냄
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ai Assistant'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black, // 배경색을 어둡게 설정
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageBubble(
                      _messages[index]['text'], _messages[index]['sender'], _messages[index]['image']);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo, color: Colors.blue), // 이미지 선택 버튼
                    onPressed: _pickImage, // 이미지 선택 함수 호출
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Write To Send Message',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[850],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.blue),
                    onPressed: () => _sendMessage('me'), // 송신자 정보와 함께 메시지 전송
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 말풍선 형태의 메시지 위젯을 빌드하는 함수 (이미지도 포함)
  Widget _buildMessageBubble(String message, String sender, File? image) {
    bool isMe = sender == 'me'; // 내가 보낸 메시지 여부를 확인
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isMe ? Colors.blue : Colors.grey[800], // 보낸 메시지와 받은 메시지 색상 구분
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: isMe ? Radius.circular(16) : Radius.circular(0),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.isNotEmpty)
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white, // 텍스트 색상을 흰색으로 설정
                  ),
                ),
              if (image != null) // 이미지가 있으면 표시
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.file(
                    image,
                    width: 150, // 이미지 크기 조정
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
