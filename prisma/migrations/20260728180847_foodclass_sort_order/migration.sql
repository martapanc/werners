-- AlterTable
ALTER TABLE "FoodClass" DROP COLUMN "image",
ADD COLUMN     "sortOrder" INTEGER NOT NULL DEFAULT 0;

-- CreateIndex
CREATE INDEX "FoodClass_sortOrder_idx" ON "FoodClass"("sortOrder");

