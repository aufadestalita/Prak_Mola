import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicWidgetScreen(),
    );
  }
}

class MusicWidgetScreen extends StatefulWidget {
  const MusicWidgetScreen({Key? key}) : super(key: key);

  @override
  State<MusicWidgetScreen> createState() => _MusicWidgetScreenState();
}

class _MusicWidgetScreenState extends State<MusicWidgetScreen> {
  final TextEditingController _playlistController = TextEditingController();
  double _playbackProgress = 35.0;
  bool _isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3E50),
      // 1. Center Widget: Menengahkan seluruh widget di layar
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // 2. Column Widget: Menyusun elemen secara vertikal ke bawah
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 3. Stack Widget: Menumpuk elemen pada widget pemutar musik
              Stack(
                alignment: Alignment.topRight,
                children: [
                  // 4. Container Widget (Widget menarik/utama: Kotak kartu pemutar musik)
                  Container(
                    width: 320,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3F4E68),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bagian atas: Cover lagu dan judul (Row)
                        Row(
                          children: [
                            // 5. Image Widget: Cover album musik
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://picsum.photos/100/100',
                                width: 55,
                                height: 55,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Informasi Lagu
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  // 6. Text Widget: Judul lagu
                                  Text(
                                    'Ep. #42 | Lo-Fi Vibes',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  // 7. Text Widget: Nama artis/podcast
                                  Text(
                                    'The Chill Station',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // 8. Slider Widget: Progress bar lagu yang interaktif
                        Slider(
                          value: _playbackProgress,
                          min: 0,
                          max: 100,
                          activeColor: Colors.purpleAccent,
                          inactiveColor: Colors.white24,
                          onChanged: (value) {
                            setState(() {
                              _playbackProgress = value;
                            });
                          },
                        ),

                        // Tombol kontrol media (Row)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            // 9. Icon Widget: Tombol kontrol pemutar musik
                            Icon(Icons.replay_10, color: Colors.white70, size: 20),
                            Icon(Icons.skip_previous, color: Colors.white, size: 24),
                            Icon(Icons.pause, color: Colors.white, size: 28),
                            Icon(Icons.skip_next, color: Colors.white, size: 24),
                            Icon(Icons.favorite, color: Colors.redAccent, size: 22),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Badge kecil di pojok kartu
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.music_note, color: Colors.white38, size: 16),
                  ),
                ],
              ),
              const SizedBox(height: 35),

              // Bagian input untuk menambah antrean playlist
              // 10. TextField Widget
              TextField(
                controller: _playlistController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Cari atau tambahkan lagu...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                ),
              ),
              const SizedBox(height: 12),

              // 11. TextButton Widget
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Menambahkan "${_playlistController.text}" ke antrean pemutar musik'),
                      backgroundColor: Colors.purple.shade900,
                    ),
                  );
                },
                child: const Text(
                  'Putar Sekarang',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}