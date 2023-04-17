# Penulisan R -------------------------------------------------------------
obj1 <- 12
obj1


# Tipe Data ---------------------------------------------------------------
# Logical
obj.true <- TRUE
obj.true

obj.false <- FALSE
obj.false
class(obj.false)

# Numeric/Double
obj.num1 <- 20
obj.num1

obj.num2 <- 20.123
obj.num2

obj.num2 <- 10.1

# Character
obj.teks1 <- "Hellooo semuaa"
obj.teks2 <- "1.23"
'12'

# Date
obj.tanggal <- as.Date("2022/12/26")

# Integer
obj.integer <- 1L
class(obj.integer)

# Kompleks
z <- 2i + 3
class(z)


# Objek -------------------------------------------------------------------
ls()
print(ls(pattern = "teks"))


# Vector dan Matriks ------------------------------------------------------
# Vektor
obj.angka <- c(1, 2, 3, 4, 5)
obj.teks3 <- c("aku", "kamu", "dia")
obj.teks3[3]

# Matriks
matriks_a <- matrix(data = 0,
                    nrow = 2,
                    ncol = 2)
matriks_b <- matrix(data = c(1, 2, 3, 4, 5, 6),
                    nrow = 2,
                    byrow = FALSE)
matriks_b


# Membuat Sequence --------------------------------------------------------
obj.seq <- 1:10
obj.seq2 <- seq(1, 3, by = 0.5)


# Fungsi ------------------------------------------------------------------
penjumlahan <- function(a, b){
  jumlah <- a + b
  return(jumlah + 5)
}
penjumlahan(a = obj.num1,
            b = obj.num2)
obj.jumlah <- penjumlahan(obj.num1, obj.num2)
obj.jumlah


# Pengkondisian -----------------------------------------------------------
if (obj.jumlah > 10) {
  print('lebih dari sepuluh')
} else {
  print('kurang dari sepuluh')
}


# Looping -----------------------------------------------------------------
week <- c("senin", "selasa", "rabu", "kamis", "sabtu", "minggu", 1, 2, 3)
week[c(1, 4, 5)]
class(week[3:7])

for (day in week) {
  print(day)
}

# array -------------------------------------------------------------------
v1 <- c(1:3)
v2 <- c(9:11)

array <- array(c(v1, v2), dim = c(3,2,2))
array


# data frame --------------------------------------------------------------
id <- c(1:3)
nama <- c('a', 'b', 'c')
jabatan <- c('GIS Officer', 'Admin', 'Surveyor')

df.team <- data.frame(id, nama, jabatan)
df.team
