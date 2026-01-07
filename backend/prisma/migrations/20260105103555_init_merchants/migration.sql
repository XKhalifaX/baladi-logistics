-- CreateTable
CREATE TABLE "Merchant" (
    "id" SERIAL NOT NULL,
    "b_name" TEXT NOT NULL,
    "phone_no" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "Merchant_pkey" PRIMARY KEY ("id")
);
