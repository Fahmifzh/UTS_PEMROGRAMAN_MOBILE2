
=======
# 🛍️ Ami Shop – Flutter Real-Time Cart App (Cubit Architecture)

**Nama:** Fahmi Fauziah Nur Fadillah
**Kelas:** TIF RP 23 CNS A
**NIM:** 23552011314
**Mata Kuliah:** Pemrograman Mobile 2

---

## 📌 Tentang Proyek

Ami Shop adalah aplikasi simulasi **kasir / keranjang belanja real-time** yang dibuat menggunakan **Flutter dengan State Management Cubit**.

Aplikasi ini memiliki dua halaman utama:

1. **Halaman Produk (Grid)**
   Menampilkan daftar barang dalam bentuk grid. Pengguna dapat menekan tombol *Add to Cart* untuk memasukkan produk ke keranjang.

2. **Halaman Ringkasan Keranjang**
   Menampilkan produk yang sudah dipilih, total barang, total harga, serta tombol:

   * `+` menambah jumlah item
   * `-` mengurangi jumlah
   * `Checkout` untuk mengosongkan keranjang

State keranjang dikelola secara terpusat di `CartCubit`, sehingga setiap perubahan data langsung memperbarui UI secara otomatis tanpa perlu `setState`.

---

## 📁 Struktur Folder

```
lib/
├── blocs/
│   └── cart_cubit.dart
├── models/
│   └── product_model.dart
├── pages/
│   ├── cart_home_page.dart
│   ├── cart_grid_page.dart
│   └── cart_summary_page.dart
├── widgets/
│   └── product_card.dart
└── main.dart
```

Struktur dibuat modular agar:

* mudah dibaca
* mudah diperluas
* business logic terpisah dari UI

---

## 🎨 Tema & Desain

* Tema clean, modern, dan profesional
* Tidak menggunakan warna biru & hijau
* Menggunakan nuansa lembut seperti pastel, cream, beige, atau warm tones
* Menonjolkan kesan minimalis, rapi, dan “aesthetic”

---

# 🧠 Bagian A – Teori

## 1. Perbedaan Cubit dan BLoC (10 poin)

### **BLoC (Business Logic Component)**

* Menggunakan **event → state**
* UI mengirim **Event**, BLoC memproses, dan mengembalikan **State**
* Cocok untuk aplikasi dengan alur kompleks
* Lebih banyak boilerplate (class Event dan State terpisah)

### **Cubit**

* Bentuk lebih sederhana dari BLoC
* Tidak memakai event, hanya memanggil fungsi untuk mengubah **state langsung**
* Lebih cepat ditulis, cocok untuk aplikasi skala kecil–menengah

### 🔎 Kesimpulan

Cubit = BLoC versi minimalis (method-based),
BLoC = penuh event dan cocok untuk alur besar atau audit state.

---

## 2. Kenapa penting memisahkan Model, Logic, dan UI? (10 poin)

1. **Lebih mudah dibaca & dipelihara**
   Kode tidak menumpuk di satu file.
2. **Lebih mudah dites**
   Logika bisa diuji tanpa UI.
3. **Reusable**
   Satu logic bisa dipakai di banyak halaman.
4. **Scalable**
   Tim dapat bekerja paralel.
5. **Debugging lebih mudah**
   Kesalahan mudah dilacak apakah dari UI, model, atau logic.

---

## 3. Minimal 3 State pada CartCubit & Fungsinya (10 poin)

1. **InitialState / CartState(items: {})**

   * Keranjang kosong pertama kali aplikasi berjalan.

2. **UpdatedState / CartState(items: {...})**

   * Terjadi setiap kali add/remove/update produk.
   * UI langsung berubah otomatis.

3. **LoadingState** *(opsional)*

   * Jika ada operasi async seperti menyimpan transaksi.

4. **ErrorState** *(opsional)*

   * Jika terjadi kesalahan saat update keranjang.

---

# 💻 Bagian B – Fitur Implementasi

### ✔ Product Model (`product_model.dart`)

Berisi:

* id (String)
* name (String)
* price (int)
* image (String)
* method:

  * `toMap()`
  * `fromMap()`

### ✔ CartCubit (`cart_cubit.dart`)

Menyediakan fungsi:

* `addToCart()`
* `removeFromCart()`
* `updateQuantity()`
* `getTotalPrice()`
* `getTotalItems()`
* `clearCart()`

### ✔ UI

1. **Product Card**
2. **Grid Page untuk daftar produk**
3. **Summary Page untuk ringkasan keranjang**

Setiap perubahan data memicu update UI otomatis melalui Cubit.

---

# 📷 Asset Gambar Produk

Pastikan gambar ada di folder `/assets/images/` dengan nama:

```
baju1.jpg
baju2.jpg
baju3.jpg
```

Dan ditambahkan ke `pubspec.yaml`.

---

# 🚀 Hasil Akhir

Dengan aplikasi ini mahasiswa memahami:

| Skill                | Pemahaman                           |
| -------------------- | ----------------------------------- |
| Flutter UI           | Membuat tampilan grid dan card      |
| Cubit                | Manajemen state realtime            |
| Clean Architecture   | Pisah business logic, UI, dan model |
| Reactive Programming | UI otomatis mengikuti state         |

---

# 🧑‍🎓 Dibuat oleh

**Fahmi Fauziah Nur Fadillah**
TIF RP 23 CNS A
Pemrograman Mobile 2
Universitas … *(tambahkan bila perlu)*

---


