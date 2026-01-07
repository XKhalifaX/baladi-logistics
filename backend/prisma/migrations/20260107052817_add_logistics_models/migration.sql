/*
  Warnings:

  - The primary key for the `Merchant` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Merchant` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Merchant" DROP CONSTRAINT "Merchant_pkey",
DROP COLUMN "id",
ADD COLUMN     "merchant_id" SERIAL NOT NULL,
ADD CONSTRAINT "Merchant_pkey" PRIMARY KEY ("merchant_id");

-- CreateTable
CREATE TABLE "Driver" (
    "driver_id" SERIAL NOT NULL,
    "d_name" TEXT NOT NULL,
    "current_Lat" DOUBLE PRECISION NOT NULL,
    "current_Long" DOUBLE PRECISION NOT NULL,
    "Status" BOOLEAN NOT NULL,

    CONSTRAINT "Driver_pkey" PRIMARY KEY ("driver_id")
);

-- CreateTable
CREATE TABLE "Product" (
    "product_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "stock_count" INTEGER NOT NULL,
    "merchant_id" INTEGER NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("product_id")
);

-- CreateTable
CREATE TABLE "Delivery" (
    "delivery_id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "merchant_id" INTEGER NOT NULL,
    "driver_id" INTEGER,

    CONSTRAINT "Delivery_pkey" PRIMARY KEY ("delivery_id")
);

-- CreateTable
CREATE TABLE "DeliveryItem" (
    "di_id" SERIAL NOT NULL,
    "quantity" INTEGER NOT NULL,
    "delivery_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,

    CONSTRAINT "DeliveryItem_pkey" PRIMARY KEY ("di_id")
);

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_merchant_id_fkey" FOREIGN KEY ("merchant_id") REFERENCES "Merchant"("merchant_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Delivery" ADD CONSTRAINT "Delivery_merchant_id_fkey" FOREIGN KEY ("merchant_id") REFERENCES "Merchant"("merchant_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Delivery" ADD CONSTRAINT "Delivery_driver_id_fkey" FOREIGN KEY ("driver_id") REFERENCES "Driver"("driver_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeliveryItem" ADD CONSTRAINT "DeliveryItem_delivery_id_fkey" FOREIGN KEY ("delivery_id") REFERENCES "Delivery"("delivery_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeliveryItem" ADD CONSTRAINT "DeliveryItem_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;
