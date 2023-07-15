-- CreateEnum
CREATE TYPE "Role" AS ENUM ('Admin', 'Secretaria', 'Lecturador', 'Socio');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "ci" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'Socio',
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Readmether" (
    "id" TEXT NOT NULL,
    "consumom3" DOUBLE PRECISION NOT NULL,
    "totalprice" DECIMAL(65,30) NOT NULL,
    "previousreading" DOUBLE PRECISION NOT NULL,
    "currentreading" DOUBLE PRECISION NOT NULL,
    "mouth" TEXT NOT NULL,
    "year" TEXT NOT NULL,
    "paymentdate" TIMESTAMP(3),
    "readerId" TEXT NOT NULL,
    "socioid" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "Parameters" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "Penalty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "cost" DECIMAL(65,30) NOT NULL,
    "description" TEXT,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "Penaltyrecord" (
    "id" TEXT NOT NULL,
    "cost" DECIMAL(65,30) NOT NULL,
    "description" TEXT,
    "resgisterbyId" TEXT NOT NULL,
    "paymentDate" TIMESTAMP(3),
    "penaltyId" TEXT NOT NULL,
    "socioId" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_ci_key" ON "User"("ci");

-- CreateIndex
CREATE UNIQUE INDEX "Readmether_id_key" ON "Readmether"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Parameters_id_key" ON "Parameters"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Penalty_id_key" ON "Penalty"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Penaltyrecord_id_key" ON "Penaltyrecord"("id");

-- AddForeignKey
ALTER TABLE "Readmether" ADD CONSTRAINT "Readmether_readerId_fkey" FOREIGN KEY ("readerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Readmether" ADD CONSTRAINT "Readmether_socioid_fkey" FOREIGN KEY ("socioid") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Penaltyrecord" ADD CONSTRAINT "Penaltyrecord_resgisterbyId_fkey" FOREIGN KEY ("resgisterbyId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Penaltyrecord" ADD CONSTRAINT "Penaltyrecord_penaltyId_fkey" FOREIGN KEY ("penaltyId") REFERENCES "Penalty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Penaltyrecord" ADD CONSTRAINT "Penaltyrecord_socioId_fkey" FOREIGN KEY ("socioId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
